import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markets/src/controllers/cart_controller.dart';
import 'package:markets/src/elements/ProductsCarouselItemWidget.dart';
import 'package:markets/src/elements/ProductsCarouselWidget.dart';
import 'package:markets/src/elements/SearchBarWidget.dart';
import 'package:markets/src/elements/ShoppingCartButtonWidget.dart';
import 'package:markets/src/models/market.dart';
import 'package:markets/src/models/media.dart';
import 'package:markets/src/repository/cart_repository.dart';
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
  ValueChanged onClickFilter;
  List<String> selectedCategories;

  _Details2WidgetState() : super((MarketController())) {
    _con = controller;
  }

  @override
  void initState() {
    _con.listenForMarket(id: widget.routeArgument.id);
    _con.listenForGalleries(widget.routeArgument.id);
    _con.listenForFeaturedProducts(widget.routeArgument.id);
    _con.listenForMarketReviews(id: widget.routeArgument.id);
    _con.listenForCategories();
    selectedCategories = ['0'];
    _con.listenForProducts(widget.routeArgument.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _con.scaffoldKey,
        /* appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/Pages', arguments: 0);
            },
            icon: Icon(Icons.arrow_back),
            color: Theme.of(context).hintColor,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            S.of(context).cart,
            style: Theme.of(context).textTheme.headline6.merge(TextStyle(letterSpacing: 1.3)),
          ),
        ),*/
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).pushNamed('/Cart', arguments: RouteArgument(param: '/Details2', id: _con.market.id));
          },
          //Navigator.of(context).pushNamed('/Menu', arguments: new RouteArgument(id: widget.routeArgument.id));

          isExtended: true,
          materialTapTargetSize: MaterialTapTargetSize.padded,

          label: Container(
            width: 300.0,
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    S.of(context).go_to_cart,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  //Text(_con..length.toString())
                  //getCartCount()
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: RefreshIndicator(
            onRefresh: _con.refreshMarket,
            child: _con.market == null
                ? CircularLoadingWidget(height: 300)
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          fit: StackFit.loose,
                          //overflow:OverflowBarAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 380,
                              width: double.infinity,
                              child: Hero(
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
                            marketCard()
                          ],
                        ),

                        SizedBox(
                          height: 90.0,
                        ),

                        searchBarMarket(),
                        //SearchBarWidget(),
                        //Sales Items
                        trendingProduct(),

                        ///All manu
                        
                        marketAllProduct(),

                        ///Review
                        marketReview(),
                      ],
                    ),
                  )));
  }

  Widget trendingProduct() {
    return Column(
      children: [
        ListTile(
          dense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          leading: Icon(
            Icons.trending_up,
            color: Theme.of(context).hintColor,
          ),
          title: Text(
            S.of(context).trending_this_week,
            style: Theme.of(context).textTheme.headline4,
          ),
          subtitle: Text(
            S.of(context).clickOnTheProductToGetMoreDetailsAboutIt,
            maxLines: 2,
            style: Theme.of(context).textTheme.caption,
          ),
        ),

        ///Product slides
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
    );
  }

  Widget marketAllProduct() {
    return Column(
      children: [
        ///All Product
        ListTile(
          dense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          leading: Icon(
            Icons.trending_up,
            color: Theme.of(context).hintColor,
          ),
          title: Text(
            S.of(context).all_product,
            style: Theme.of(context).textTheme.headline4,
          ),
          subtitle: Text(
            S.of(context).clickOnTheProductToGetMoreDetailsAboutIt,
            maxLines: 2,
            style: Theme.of(context).textTheme.caption,
          ),
        ),

        ///Product ListView
        _con.products.isEmpty
            ? Center(
                child: Container(
                  height: 250.0,
                  width: 200.0,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/img/not_found.png'))),
                ),
              )
            : ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                primary: false,
                itemCount: _con.products.length,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10);
                },
                itemBuilder: (context, index) {
                  return ProductItemWidget(
                    heroTag: 'menu_list',
                    product: _con.products.elementAt(index),
                  );
                },
              ),
      ],
    );
  }

  Widget marketReview() {
    return Column(
      children: [
        //Review List
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
            ? Text("Loading...")
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ReviewsListWidget(reviewsList: _con.reviews),
              ),
      ],
    );
  }

  Widget marketCard() {
    return Positioned(
      top: 350.0,
      left: 18.0,
      right: 18.0,

      //bottom: 0.0,
      child: SizedOverflowBox(
        size: Size.square(20.0),
        alignment: Alignment.center,
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
                    fontSize: 30.0,
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        _con.market.phone,
                        style: TextStyle(
                          fontFamily: 'ProductSans',
                          fontSize: 15.0,
                          color: Colors.grey,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Theme.of(context).accentColor,
                          ),
                          Row(
                            children: [
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
                                  ("( ${_con.reviews.length.toString()} )"),
                                  style: TextStyle(
                                    fontFamily: 'ProductSans',
                                    fontSize: 15.0,
                                    color: Colors.grey,
                                    //fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: Container(height: 20, width: 20, child: Image.asset('assets/img/marker.png')),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      shape: StadiumBorder(),
                      onPressed: () {},
                      child: Text("20-30 minutes"),
                    ),
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
    );
  }

  Widget searchBarMarket() {
    return InkWell(
      // onTap: () {
      //   Navigator.of(context).pushNamed('/Menu', arguments: new RouteArgument(id: widget.routeArgument.id));
      // },
      child: Column(
        children: [
          Container(
            height: 90,
            child: ListView(
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: List.generate(_con.categories.length, (index) {
                var _category = _con.categories.elementAt(index);
                var _selected = this.selectedCategories.contains(_category.id);
                return Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20),
                  child: RawChip(
                    elevation: 0,
                    label: Text(_category.name),
                    labelStyle: _selected
                        ? Theme.of(context).textTheme.bodyText2.merge(TextStyle(color: Theme.of(context).primaryColor))
                        : Theme.of(context).textTheme.bodyText2,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                    backgroundColor: Theme.of(context).focusColor.withOpacity(0.1),
                    selectedColor: Theme.of(context).accentColor,
                    selected: _selected,
                    //shape: StadiumBorder(side: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.05))),
                    showCheckmark: false,
                    avatar: (_category.id == '0')
                        ? null
                        : (_category.image.url.toLowerCase().endsWith('.svg')
                            ? SvgPicture.network(
                                _category.image.url,
                                color: _selected ? Theme.of(context).primaryColor : Theme.of(context).accentColor,
                              )
                            : CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: _category.image.icon,
                                placeholder: (context, url) => Image.asset(
                                  'assets/img/loading.gif',
                                  fit: BoxFit.cover,
                                ),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              )),
                    onSelected: (bool value) {
                      setState(() {
                        if (_category.id == '0') {
                          this.selectedCategories = ['0'];
                        } else {
                          this.selectedCategories.removeWhere((element) => element == '0');
                        }
                        if (value) {
                          this.selectedCategories.add(_category.id);
                        } else {
                          this.selectedCategories.removeWhere((element) => element == _category.id);
                        }
                        _con.selectCategory(this.selectedCategories);
                      });

                      ///Product ListView
                      _con.featuredProducts.isEmpty
                          ? Text("Loading...")
                          : ListView.separated(
                              scrollDirection: Axis.vertical,
                              itemCount: 10,
                              separatorBuilder: (context, index) => Divider(),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Text(_con.products.length.toString()),
                                    ProductItemWidget(
                                      heroTag: 'menu_list',
                                      product: _con.products.elementAt(index),
                                    ),
                                  ],
                                );
                              },
                            );
                    },
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
