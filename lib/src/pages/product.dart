import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/l10n.dart';
import '../controllers/product_controller.dart';
import '../elements/AddToCartAlertDialog.dart';
import '../elements/CircularLoadingWidget.dart';
import '../elements/OptionItemWidget.dart';
import '../elements/ReviewsListWidget.dart';
import '../elements/ShoppingCartFloatButtonWidget.dart';
import '../helpers/helper.dart';
import '../models/route_argument.dart';
import '../repository/user_repository.dart';

// ignore: must_be_immutable
class ProductWidget extends StatefulWidget {
  RouteArgument routeArgument;

  ProductWidget({Key key, this.routeArgument}) : super(key: key);

  @override
  _ProductWidgetState createState() {
    return _ProductWidgetState();
  }
}

class _ProductWidgetState extends StateMVC<ProductWidget> {
  ProductController _con;

  _ProductWidgetState() : super(ProductController()) {
    _con = controller;
  }

  @override
  void initState() {
    _con.listenForProduct(productId: widget.routeArgument.id);
    _con.listenForCart();
    _con.listenForFavorite(productId: widget.routeArgument.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      body: _con.product == null || _con.product?.image == null
          ? CircularLoadingWidget(height: 500)
          : RefreshIndicator(
              onRefresh: _con.refreshProduct,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    padding: EdgeInsets.only(bottom: 15),
                    child: CustomScrollView(
                      primary: true,
                      shrinkWrap: false,
                      slivers: <Widget>[
                        SliverAppBar(
                          backgroundColor: Theme.of(context).accentColor.withOpacity(0.9),
                          expandedHeight: 300,
                          elevation: 0,
                          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
                          flexibleSpace: FlexibleSpaceBar(
                            collapseMode: CollapseMode.parallax,
                            background: Hero(
                              tag: widget.routeArgument.heroTag ?? '' + _con.product.id,
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: _con.product.image.url,
                                placeholder: (context, url) => Image.asset(
                                  'assets/img/loading.gif',
                                  fit: BoxFit.cover,
                                ),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            child: Wrap(
                              runSpacing: 8,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            _con.product?.name ?? '',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 5,
                                            style: Theme.of(context).textTheme.headline3.merge (TextStyle(color: Theme.of(context).accentColor)),
                                          ),
                                          
                                        ],
                                      ),
                                    ),
                                   
                                  ],
                                ),
                                
                                Divider(height: 10),
                                Text(Helper.skipHtml(_con.product.description)),
                                ListTile(
                                  dense: true,
                                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                                  title: Text(
                                    S.of(context).options,
                                    style: Theme.of(context).textTheme.headline3.merge (TextStyle(color: Theme.of(context).accentColor)),
                                  ),
                                ),
                                _con.product.optionGroups == null
                                    ? CircularLoadingWidget(height: 50)
                                    : ListView.separated(
                                        padding: EdgeInsets.all(0),
                                        itemBuilder: (context, optionGroupIndex) {
                                          var optionGroup = _con.product.optionGroups.elementAt(optionGroupIndex);
                                          return Wrap(
                                            children: <Widget>[
                                              ListTile(
                                                dense: true,
                                                contentPadding: EdgeInsets.symmetric(vertical: 0),
                                                title: Text(
                                                  optionGroup.name,
                                                  style: Theme.of(context).textTheme.caption,
                                                ),
                                              ),
                                              ListView.separated(
                                                padding: EdgeInsets.all(0),
                                                itemBuilder: (context, optionIndex) {
                                                  return OptionItemWidget(
                                                    option: _con.product.options
                                                        .where((option) => option.optionGroupId == optionGroup.id)
                                                        .elementAt(optionIndex),
                                                    onChanged: _con.calculateTotal,
                                                  );
                                                },
                                                separatorBuilder: (context, index) {
                                                  return SizedBox(height: 20);
                                                },
                                                itemCount: _con.product.options.where((option) => option.optionGroupId == optionGroup.id).length,
                                                primary: false,
                                                shrinkWrap: true,
                                              ),
                                            ],
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return SizedBox(height: 20);
                                        },
                                        itemCount: _con.product.optionGroups.length,
                                        primary: false,
                                        shrinkWrap: true,
                                      ),
                                ListTile(
                                  dense: true,
                                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                                  leading: Icon(
                                    Icons.recent_actors,
                                    color: Theme.of(context).hintColor,
                                  ),
                                  title: Text(
                                    S.of(context).reviews,
                                    style: Theme.of(context).textTheme.subtitle1,
                                  ),
                                ),
                                ReviewsListWidget(
                                  reviewsList: _con.product.productReviews,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 32,
                    right: 20,
                    child: _con.loadCart
                        ? SizedBox(
                            width: 60,
                            height: 60,
                            child: RefreshProgressIndicator(),
                          )
                        : ShoppingCartFloatButtonWidget(
                            
                            //gotocart
                            
                          ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 150,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                          boxShadow: [BoxShadow(color: Theme.of(context).focusColor.withOpacity(0.15), offset: Offset(0, -2), blurRadius: 5.0)]),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 40,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Row(
                              children: <Widget>[                               
                                Container(
                                  child: Center(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(left:115.0),
                                          child: Container(
                                            child: Center(
                                              child: IconButton(
                                                onPressed: () {
                                                  _con.decrementQuantity();
                                                },
                                                iconSize: 40,
                                                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                                                icon: Icon(Icons.remove_circle_outline),
                                                color: Theme.of(context).accentColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text((_con.quantity.floor().toString()), style: Theme.of(context).textTheme.subtitle1),
                                        IconButton(
                                          onPressed: () {
                                            _con.incrementQuantity();
                                          },
                                          iconSize: 40,
                                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                                          icon: Icon(Icons.add_circle_outline),
                                          color: Theme.of(context).accentColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: _con.favorite?.id != null
                                      ? OutlineButton(
                                          onPressed: () {
                                            _con.removeFromFavorite(_con.favorite);
                                          },
                                          padding: EdgeInsets.symmetric(vertical: 14),
                                          color: Theme.of(context).primaryColor,
                                          shape: StadiumBorder(),
                                          borderSide: BorderSide(color: Theme.of(context).accentColor),
                                          child: Icon(
                                            Icons.favorite,
                                            color: Theme.of(context).accentColor,
                                          ))
                                      : FlatButton(
                                          onPressed: () {
                                            if (currentUser.value.apiToken == null) {
                                              Navigator.of(context).pushNamed("/Login");
                                            } else {
                                              _con.addToFavorite(_con.product);
                                            }
                                          },
                                          padding: EdgeInsets.symmetric(vertical: 14),
                                          color: Theme.of(context).accentColor,
                                          shape: StadiumBorder(),
                                          child: Icon(
                                            Icons.favorite,
                                            color: Theme.of(context).primaryColor,
                                          )),
                                ),
                                SizedBox(width: 10),
                                Stack(
                                  fit: StackFit.loose,
                                  alignment: AlignmentDirectional.centerEnd,
                                  children: <Widget>[
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width - 110,
                                      child: FlatButton(
                                        onPressed: () {
                                          if (currentUser.value.apiToken == null) {
                                            Navigator.of(context).pushNamed("/Login");
                                          } else {
                                            if (_con.isSameMarkets(_con.product)) {
                                              _con.addToCart(_con.product);
                                            } else {
                                              
                                            }
                                          }
                                        },
                                        padding: EdgeInsets.symmetric(vertical: 14),
                                        color: Theme.of(context).accentColor,
                                        shape: StadiumBorder(),
                                        child: Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(horizontal: 20),
                                          child: Text(
                                            S.of(context).add_to_cart,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(color: Theme.of(context).primaryColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: Helper.getPrice(
                                        _con.total,
                                        context,
                                        style: Theme.of(context).textTheme.headline4.merge(TextStyle(color: Theme.of(context).primaryColor)),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
