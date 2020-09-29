import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/l10n.dart';
import '../controllers/checkout_controller.dart';
import '../elements/CircularLoadingWidget.dart';
import '../helpers/helper.dart';
import '../models/payment.dart';
import '../models/route_argument.dart';

class OrderSuccess2Widget extends StatefulWidget {
  final RouteArgument routeArgument;

  OrderSuccess2Widget({Key key, this.routeArgument}) : super(key: key);

  @override
  _OrderSuccess2WidgetState createState() => _OrderSuccess2WidgetState();
}

class _OrderSuccess2WidgetState extends StateMVC<OrderSuccess2Widget> {
  CheckoutController _con;

  _OrderSuccess2WidgetState() : super(CheckoutController()) {
    _con = controller;
  }

  @override
  void initState() {
    // route param contains the payment method
    _con.payment = new Payment(widget.routeArgument.param);
    _con.listenForCarts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _con.scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back),
            color: Theme.of(context).hintColor,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            S.of(context).confirmation,
            style: Theme.of(context)
                .textTheme
                .headline6
                .merge(TextStyle(letterSpacing: 1.3)),
          ),
        ),
        body: _con.carts.isEmpty
            ? CircularLoadingWidget(height: 500)
            : Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    alignment: AlignmentDirectional.center,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                /*gradient: LinearGradient(
                                    begin: Alignment.bottomLeft, 
                                    end: Alignment.topRight, 
                                    colors: [
                                      const Colors.green.withOpacity(1), 
                                      Colors.green.withOpacity(0.2)
                                      ]
                                  )*/
                              ),
                              child: _con.loading
                                  ? Padding(
                                      padding: EdgeInsets.all(55),
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            new AlwaysStoppedAnimation<Color>(
                                                Theme.of(context)
                                                    .scaffoldBackgroundColor),
                                      ),
                                    )
                                  : Icon(
                                      Icons.check,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      size: 90,
                                    ),
                            ),
                            Positioned(
                              right: -30,
                              bottom: -50,
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor
                                      .withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(150),
                                ),
                              ),
                            ),
                            Positioned(
                              left: -20,
                              top: -50,
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor
                                      .withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(150),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        // Opacity(
                        //   opacity: 0.4,
                        //   child: Text(
                        //     S
                        //         .of(context)
                        //         .your_order_has_been_successfully_submitted,
                        //     textAlign: TextAlign.center,
                        //     style: Theme.of(context)
                        //         .textTheme
                        //         .headline3
                        //         .merge(TextStyle(fontWeight: FontWeight.w300)),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 455,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                color: Theme.of(context)
                                    .focusColor
                                    .withOpacity(0.15),
                                offset: Offset(0, -2),
                                blurRadius: 5.0)
                          ]),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 40,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                // Expanded(
                                //   child: Text(
                                //     S.of(context).subtotal,
                                //     style:
                                //         Theme.of(context).textTheme.bodyText1,
                                //   ),
                                // ),
                                // Helper.getPrice(_con.subTotal, context,
                                //     style:
                                //         Theme.of(context).textTheme.subtitle1)
                              ],
                            ),
                            SizedBox(height: 3),
                            _con.payment.method == 'Pay on Pickup'
                                ? SizedBox(height: 0)
                                : Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          S.of(context).delivery_fee,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ),
                                      Helper.getPrice(
                                          _con.carts[0].product.market
                                              .deliveryFee,
                                          context,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1)
                                    ],
                                  ),
                            SizedBox(height: 3),
                            Row(
                                // children: <Widget>[
                                //   Expanded(
                                //     child: Text(
                                //       "${S.of(context).tax} (${_con.carts[0].product.market.defaultTax}%)",
                                //       style:
                                //           Theme.of(context).textTheme.bodyText1,
                                //     ),
                                //   ),
                                //   Helper.getPrice(_con.taxAmount, context,
                                //       style:
                                //           Theme.of(context).textTheme.subtitle1)
                                // ],
                                ),
                            //Divider(height: 30),
                            Row(
                                // children: <Widget>[
                                //   Expanded(
                                //     child: Text(
                                //       S.of(context).total,
                                //       style:
                                //           Theme.of(context).textTheme.headline6,
                                //     ),
                                //   ),
                                //   Helper.getPrice(_con.total, context,
                                //       style:
                                //           Theme.of(context).textTheme.headline6)
                                // ],
                                ),
                            Image.asset(
                              'assets/img/logo.png',
                              height: 100,
                              width: 100,
                            ),
                            SizedBox(height: 3),

                            Center(
                                child: Text(
                              'Thank you for your Order',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25.0),
                            )),
                            SizedBox(height: 20),
                            Opacity(
                              opacity: 0.4,
                              child: Center(
                                  child: Text(
                                'You can track the delivery in the \n"Orders" section ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              )),
                            ),
                            SizedBox(height: 100),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 40,
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed('/Track_orders');
                                  // Navigator.of(context).pushNamed('/Pages', arguments: 3);
                                },
                                padding: EdgeInsets.symmetric(vertical: 14),
                                color: Theme.of(context).accentColor,
                                shape: StadiumBorder(),
                                child: Text(
                                  S.of(context).track_my_order,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 40,
                              child: OutlineButton(
                                onPressed: () {
                                  //Navigator.of(context).pushNamed('/orders');
                                  Navigator.of(context)
                                      .pushNamed('/Pages', arguments: 0);
                                },
                                padding: EdgeInsets.symmetric(vertical: 14),
                                color: Theme.of(context).accentColor,
                                shape: StadiumBorder(),
                                child: Text(
                                  S.of(context).order_something_else,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      //color: Theme.of(context).primaryColor
                                      color: Colors.pink),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ));
  }
}