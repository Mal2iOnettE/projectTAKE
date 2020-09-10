import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:markets/src/elements/ProductsCarouselItemWidget.dart';
import 'package:markets/src/elements/SearchBarWidget.dart';
import 'package:markets/src/elements/ShoppingCartButtonWidget.dart';
import 'package:markets/src/repository/user_repository.dart';
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
            Navigator.of(context).pushNamed('/Cart', arguments: RouteArgument(param: '/Details2', id: _con.market.id));
          },
          //Navigator.of(context).pushNamed('/Menu', arguments: new RouteArgument(id: widget.routeArgument.id));

          isExtended: true,
          materialTapTargetSize: MaterialTapTargetSize.padded,
          // icon: Icon(
          //   Icons.shopping_basket,
          //   color: Theme.of(context).primaryColor,
          // ),

          label: Container(
           
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
                          child: Column(
                            children: [
                              SearchBarWidget(),
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
                                  )),
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
