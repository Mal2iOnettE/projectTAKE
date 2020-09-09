import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:markets/src/elements/ProductsCarouselItemWidget.dart';
import 'package:markets/src/elements/SearchBarWidget.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../generated/l10n.dart';
import '../controllers/market_controller.dart';
import '../elements/CircularLoadingWidget.dart';
import '../elements/GalleryCarouselWidget.dart';
import '../elements/ProductItemWidget.dart';
import '../elements/ReviewsListWidget.dart';
import '../elements/ShoppingCartFloatButtonWidget.dart';
import '../helpers/helper.dart';
import '../models/route_argument.dart';
import '../repository/settings_repository.dart';

class Details2Widget extends StatefulWidget {
  final RouteArgument routeArgument;

  Details2Widget({Key key, this.routeArgument}) : super(key: key);

  @override
  _Details2WidgetState createState() {
    return _Details2WidgetState();
  }
}

class _Details2WidgetState extends StateMVC<Details2Widget> {
  MarketController _con;

  _Details2WidgetState() : super(MarketController()) {
    _con = controller;
  }





  @override
  void initState() {
    _con.listenForMarket(id: widget.routeArgument.id);
    _con.listenForGalleries(widget.routeArgument.id);
    _con.listenForFeaturedProducts(widget.routeArgument.id);
    _con.listenForMarketReviews(id: widget.routeArgument.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _con.scaffoldKey,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).pushNamed('/Menu', arguments: new RouteArgument(id: widget.routeArgument.id));
          },
          isExtended: true,
          materialTapTargetSize: MaterialTapTargetSize.padded,
          // icon: Icon(
          //   Icons.shopping_basket,
          //   color: Theme.of(context).primaryColor,
          // ),

          label: Container(
            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
            width: 300.0,
            child: Center(
              child: Text(
                S.of(context).go_to_cart,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: RefreshIndicator(
          onRefresh: _con.refreshMarket,
          child: _con.market == null
              ? CircularLoadingWidget(height: 500)
              : Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    CustomScrollView(
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
                              tag: (widget?.routeArgument?.heroTag ?? '') + _con.market.id,
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: _con.market.image.url,
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
                          child: Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20, left: 20, bottom: 0, top: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    //ชื่อร้าน
                                    // Expanded(
                                    //   child: Text(
                                    //     _con.market?.name ?? '',
                                    //     overflow: TextOverflow.fade,
                                    //     softWrap: false,
                                    //     maxLines: 2,
                                    //     style: Theme.of(context)
                                    //         .textTheme
                                    //         .headline3,
                                    //   ),
                                    // ),
                                    //กรอบคะเเนนratings
                                    // SizedBox(
                                    //   height: 32,
                                    //   child: Chip(
                                    //     padding: EdgeInsets.all(0),
                                    //     label: Row(
                                    //       mainAxisAlignment:
                                    //           MainAxisAlignment.center,
                                    //       children: <Widget>[
                                    //          //คะเเนนเรต
                                    //         // Text(_con.market.rate,
                                    //         //     style: Theme.of(context)
                                    //         //         .textTheme
                                    //         //         .bodyText1
                                    //         //         .merge(TextStyle(
                                    //         //             color: Theme.of(context)
                                    //         //                 .primaryColor))),
                                    //         //รูปดาว
                                    //         // Icon(
                                    //         //   Icons.star_border,
                                    //         //   color: Theme.of(context)
                                    //         //       .primaryColor,
                                    //         //   size: 16,
                                    //         // ),
                                    //       ],
                                    //     ),
                                    //     backgroundColor: Theme.of(context)
                                    //         .accentColor
                                    //         .withOpacity(0.9),
                                    //     shape: StadiumBorder(),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(width: 20),
                                  // Container(
                                  //   padding: EdgeInsets.symmetric(
                                  //       horizontal: 12, vertical: 3),
                                  //   decoration: BoxDecoration(
                                  //       color: _con.market.closed
                                  //           ? Colors.grey
                                  //           : Colors.green,
                                  //       borderRadius:
                                  //           BorderRadius.circular(24)),
                                  //   child: _con.market.closed
                                  //       ? Text(
                                  //           S.of(context).closed,
                                  //           style: Theme.of(context)
                                  //               .textTheme
                                  //               .caption
                                  //               .merge(TextStyle(
                                  //                   color: Theme.of(context)
                                  //                       .primaryColor)),
                                  //         )
                                  //       : Text(
                                  //           S.of(context).open,
                                  //           style: Theme.of(context)
                                  //               .textTheme
                                  //               .caption
                                  //               .merge(TextStyle(
                                  //                   color: Theme.of(context)
                                  //                       .primaryColor)),
                                  //         ),
                                  // ),
                                  SizedBox(width: 10),
                                  // Container(
                                  //   padding: EdgeInsets.symmetric(
                                  //       horizontal: 12, vertical: 3),
                                  //   decoration: BoxDecoration(
                                  //       color: Helper.canDelivery(_con.market)
                                  //           ? Colors.green
                                  //           : Colors.orange,
                                  //       borderRadius:
                                  //           BorderRadius.circular(24)),
                                  //   child: Helper.canDelivery(_con.market)
                                  //       ? Text(
                                  //           S.of(context).delivery,
                                  //           style: Theme.of(context)
                                  //               .textTheme
                                  //               .caption
                                  //               .merge(TextStyle(
                                  //                   color: Theme.of(context)
                                  //                       .primaryColor)),
                                  //         )
                                  //       : Text(
                                  //           S.of(context).pickup,
                                  //           style: Theme.of(context)
                                  //               .textTheme
                                  //               .caption
                                  //               .merge(TextStyle(
                                  //                   color: Theme.of(context)
                                  //                       .primaryColor)),
                                  //         ),
                                  // ),
                                  // Expanded(child: SizedBox(height: 0)),
                                  // Container(
                                  //   padding: EdgeInsets.symmetric(
                                  //       horizontal: 12, vertical: 3),
                                  //   decoration: BoxDecoration(
                                  //       color: Helper.canDelivery(_con.market)
                                  //           ? Colors.green
                                  //           : Colors.grey,
                                  //       borderRadius:
                                  //           BorderRadius.circular(24)),
                                  //   child: Text(
                                  //     Helper.getDistance(
                                  //         _con.market.distance,
                                  //         Helper.of(context).trans(
                                  //             setting.value.distanceUnit)),
                                  //     style: Theme.of(context)
                                  //         .textTheme
                                  //         .caption
                                  //         .merge(TextStyle(
                                  //             color: Theme.of(context)
                                  //                 .primaryColor)),
                                  //   ),
                                  // ),
                                  //SizedBox(width: 20),
                                ],
                              ),

                              SearchBarWidget(),
                              Positioned(
                                  top: 10,
                                  right: 40,
                                  left: 40,
                                  child: Column(
                                    children: [
                                      Container(
                                          height: 200,
                                          padding: EdgeInsets.symmetric(vertical: 10),
                                          child: ListView.builder(
                                            itemCount: _con.featuredProducts.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              double _marginLeft = 0;
                                              (index == 0) ? _marginLeft = 20 : _marginLeft = 0;
                                              return ProductsCarouselItemWidget(
                                                marginLeft: _marginLeft,
                                                product: _con.featuredProducts.elementAt(index),
                                                heroTag: '',
                                              );
                                            },
                                          ))
                                    ],
                                  )),

                              // Padding(
                              //   padding: const EdgeInsets.symmetric(
                              //       horizontal: 20, vertical: 12),
                              //   child: Helper.applyHtml(
                              //       context, _con.market.description),
                              // ),
                              // ImageThumbCarouselWidget(
                              //     galleriesList: _con.galleries),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.symmetric(horizontal: 20),
                              //   child: ListTile(
                              //     dense: true,
                              //     contentPadding:
                              //         EdgeInsets.symmetric(vertical: 0),
                              //     leading: Icon(
                              //       Icons.stars,
                              //       color: Theme.of(context).hintColor,
                              //     ),
                              //     title: Text(
                              //       S.of(context).information,
                              //       style:
                              //           Theme.of(context).textTheme.headline4,
                              //     ),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.symmetric(
                              //       horizontal: 20, vertical: 12),
                              //   child: Helper.applyHtml(
                              //       context, _con.market.information),
                              // ),
                              // Container(
                              //   padding: const EdgeInsets.symmetric(
                              //       horizontal: 20, vertical: 20),
                              //   margin: const EdgeInsets.symmetric(vertical: 5),
                              //   color: Theme.of(context).primaryColor,
                              //   child: Row(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: <Widget>[
                              //       Expanded(
                              //         child: Text(
                              //           _con.market.address ?? '',
                              //           overflow: TextOverflow.ellipsis,
                              //           maxLines: 2,
                              //           style: Theme.of(context)
                              //               .textTheme
                              //               .bodyText1,
                              //         ),
                              //       ),
                              //       SizedBox(width: 10),
                              //       SizedBox(
                              //         width: 42,
                              //         height: 42,
                              //         child: FlatButton(
                              //           padding: EdgeInsets.all(0),
                              //           onPressed: () {
                              //             Navigator.of(context).pushNamed(
                              //                 '/Pages',
                              //                 arguments: new RouteArgument(
                              //                     id: '1', param: _con.market));
                              //           },
                              //           child: Icon(
                              //             Icons.favorite,
                              //             color: Theme.of(context).primaryColor,
                              //             size: 24,
                              //           ),
                              //           color: Theme.of(context)
                              //               .accentColor
                              //               .withOpacity(0.9),
                              //           shape: StadiumBorder(),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              // Container(
                              //   padding: const EdgeInsets.symmetric(
                              //       horizontal: 20, vertical: 20),
                              //   margin: const EdgeInsets.symmetric(vertical: 5),
                              //   color: Theme.of(context).primaryColor,
                              //   child: Row(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: <Widget>[
                              //       Expanded(
                              //         child: Text(
                              //           '${_con.market.phone} \n${_con.market.mobile}',
                              //           overflow: TextOverflow.ellipsis,
                              //           style: Theme.of(context)
                              //               .textTheme
                              //               .bodyText1,
                              //         ),
                              //       ),
                              //       SizedBox(width: 10),
                              //       SizedBox(
                              //         width: 42,
                              //         height: 42,
                              //         child: FlatButton(
                              //           padding: EdgeInsets.all(0),
                              //           onPressed: () {
                              //             launch("tel:${_con.market.mobile}");
                              //           },
                              //           child: Icon(
                              //             Icons.call,
                              //             color: Theme.of(context).primaryColor,
                              //             size: 24,
                              //           ),
                              //           color: Theme.of(context)
                              //               .accentColor
                              //               .withOpacity(0.9),
                              //           shape: StadiumBorder(),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              // _con.featuredProducts.isEmpty
                              //     ? SizedBox(height: 0)
                              //     : Padding(
                              //         padding: const EdgeInsets.symmetric(
                              //             horizontal: 20),
                              //         child: ListTile(
                              //           dense: true,
                              //           contentPadding:
                              //               EdgeInsets.symmetric(vertical: 0),
                              //           leading: Icon(
                              //             Icons.shopping_basket,
                              //             color: Theme.of(context).hintColor,
                              //           ),
                              //           title: Text(
                              //             S.of(context).featured_products,
                              //             style: Theme.of(context)
                              //                 .textTheme
                              //                 .headline4,
                              //           ),
                              //         ),
                              //       ),
<<<<<<< HEAD
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: 390.0,
                                child: SearchBarWidget(),
                              ),
                            ),

                              Container(
                                  height: 200,
                                  padding: EdgeInsets.symmetric(vertical: 0),
                                  child: ListView.builder(
                                    itemCount: _con.featuredProducts.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      double _marginLeft = 0;
                                      (index == 0) ? _marginLeft = 20 : _marginLeft = 0;
                                      return ProductsCarouselItemWidget(
                                        marginLeft: _marginLeft,
                                        product: _con.featuredProducts.elementAt(index),
                                        heroTag: '',
                                      );
                                    },
                                  )),
=======

>>>>>>> 29f975073049479df120d595a0ab9c3341ca1ea8
                              _con.featuredProducts.isEmpty
                                  ? SizedBox(height: 0)
                                  : ListView.separated(
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      primary: false,
                                      itemCount: _con.featuredProducts.length,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(height: 10);
                                      },
                                      itemBuilder: (context, index) {
                                        return ProductItemWidget(
                                          heroTag: 'details_featured_product',
                                          product: _con.featuredProducts.elementAt(index),
                                        );
                                      },
                                    ),
                              SizedBox(height: 100),
                              _con.reviews.isEmpty
                                  ? SizedBox(height: 5)
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                      child: ListTile(
                                        dense: true,
                                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                                        leading: Icon(
                                          Icons.recent_actors,
                                          color: Theme.of(context).hintColor,
                                        ),
                                        title: Text(
                                          S.of(context).what_they_say,
                                          style: Theme.of(context).textTheme.headline4,
                                        ),
                                      ),
                                    ),
                              _con.reviews.isEmpty
                                  ? SizedBox(height: 5)
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                      child: ReviewsListWidget(reviewsList: _con.reviews),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Positioned(
                      top: 200,
                      right: 40,
                      left: 40,
                      child: Container(
                        height: 200.0,
                        width: 300.0,
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                              ),
                              Center(
                                child: Text(
                                  _con.market.name,
                                  style: TextStyle(
                                    fontFamily: 'ProductSans',
                                    fontSize: 25.0,
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Text(
                                        _con.market.name,
                                        style: TextStyle(
                                          fontFamily: 'ProductSans',
                                          fontSize: 15.0,
                                          color: Colors.grey,
                                          //fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          Icon(Icons.star),
                                          Text(
                                            _con.market.rate,
                                            style: TextStyle(
                                              fontFamily: 'ProductSans',
                                              fontSize: 15.0,
                                              color: Colors.grey,
                                              //fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: Text(
                                              
                                              "( ${_con.reviews.length} )",
                                              style: TextStyle(
                                                
                                                fontSize: 15.0,
                                                color: Colors.grey,
                                                //fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                    ),
<<<<<<< HEAD
                                    Container(height: 20, width: 20, child: Image.asset('assets/img/marker.png')),
=======
                                    Container(height: 20, width: 20, child: Image.asset('assets/img/my_marker.png')),
>>>>>>> 29f975073049479df120d595a0ab9c3341ca1ea8
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'TAKE TOWN',
                                      style: TextStyle(
                                        fontFamily: 'ProductSans',
                                        fontSize: 15.0,
                                        color: Colors.grey,
                                        //fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 80,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RaisedButton(
                                      shape: StadiumBorder(),
                                      onPressed: () {},
                                      child: Text("20-30 minutes"),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.map,
                                    color: Colors.grey,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
<<<<<<< HEAD
                     
=======

>>>>>>> 29f975073049479df120d595a0ab9c3341ca1ea8
                    // Positioned(
                    //   top: 32,
                    //   right: 20,
                    //   child: ShoppingCartFloatButtonWidget(
                    //     iconColor: Theme.of(context).primaryColor,
                    //     labelColor: Theme.of(context).hintColor,
                    //     routeArgument: RouteArgument(
                    //         param: '/Details', id: widget.routeArgument.id),
                    //   ),
                    // ),
                  ],
                ),
        ));
  }
}
