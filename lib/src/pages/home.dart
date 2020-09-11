import 'package:flutter/material.dart';
import 'package:markets/src/controllers/reviews_controller.dart';
import 'package:markets/src/elements/CardWidget.dart';
import 'package:markets/src/elements/GalleryCarouselWidget.dart';
import 'package:markets/src/elements/ListMarket.dart';
import 'package:markets/src/elements/promotionsCarouselWidget.dart';
import 'package:markets/src/models/market.dart';
import 'package:markets/src/models/media.dart';
import 'package:markets/src/models/review.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/l10n.dart';
import '../controllers/home_controller.dart';
import '../elements/CardsCarouselWidget.dart';
import '../elements/CaregoriesCarouselWidget.dart';
import '../elements/DeliveryAddressBottomSheetWidget.dart';
import '../elements/GridWidget.dart';
import '../elements/ProductsCarouselWidget.dart';
import '../elements/ReviewsListWidget.dart';
import '../elements/SearchBarWidget.dart';
import '../elements/ShoppingCartButtonWidget.dart';
import '../repository/settings_repository.dart' as settingsRepo;
import '../repository/user_repository.dart';
import '../elements/FilterWidget.dart';

class HomeWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> parentScaffoldKey;
  List<Market> marketsList;
  List<Review> reviewList;

  HomeWidget(
      {Key key, this.parentScaffoldKey, this.marketsList, this.reviewList})
      : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends StateMVC<HomeWidget> {
  HomeController _con;
  ReviewsController _recon;

  _HomeWidgetState() : super(HomeController()) {
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /* leading: new IconButton(
          icon: new Icon(Icons.sort, color: Theme.of(context).hintColor),
          onPressed: () => widget.parentScaffoldKey.currentState.openDrawer(),
        ),*/
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: ValueListenableBuilder(
          valueListenable: settingsRepo.setting,
          builder: (context, value, child) {
            return Text(
              value.appName ?? S.of(context).home,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .merge(TextStyle(letterSpacing: 1.3)),
            );
          },
        ),
        actions: <Widget>[
          new ShoppingCartButtonWidget(
              iconColor: Theme.of(context).hintColor,
              labelColor: Theme.of(context).accentColor),
        ],
      ),
      body:

          //Refresh
          RefreshIndicator(
        onRefresh: _con.refreshHome,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              //Serach bar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
                child: SearchBarWidget(
                  onClickFilter: (event) {
                    widget.parentScaffoldKey.currentState.openEndDrawer();
                  },
                ),
              ),

              CategoriesCarouselWidget(
                categories: _con.categories,
              ),
              /*PromotionsCarouselWidget(
                gallery: _con.galleries,
              ),*/
              //ImageThumbCarouselWidget(galleriesList: _con.galleries),

              PromotionsCarouselWidget(),

              //Location
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 1.0),
                  trailing: Text(
                    "See all",
                    style: Theme.of(context).textTheme.caption,
                  ),
                  onTap: () => Navigator.pushNamed(context, '/AllRestaurant'),
                  title: Text(
                    S.of(context).nearby_restaurant,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  subtitle: Text(
                    S.of(context).near_to +
                        " " +
                        (settingsRepo.deliveryAddress.value?.address ??
                            S.of(context).unknown),
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
              ),

              /* ListMarkets(
                marketList: _con.topMarkets,
                heroTag: 'home_top_markets',
              ),*/

              /// Markets
              CardsCarouselWidget(
                marketsList: _con.topMarkets,
                heroTag: 'home_top_markets',
              ),

              //Trending this week
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

              //Trainding Product
              ProductsCarouselWidget(
                  productsList: _con.trendingProducts,
                  heroTag: 'home_product_carousel'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  leading: Icon(
                    Icons.category,
                    color: Theme.of(context).hintColor,
                  ),
                  title: Text(
                    S.of(context).product_categories,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
              //Most Popular
              /* CategoriesCarouselWidget(
                categories: _con.categories,
              ),*/

              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 20, top: 20),
                child: ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  leading: Icon(
                    Icons.trending_up,
                    color: Theme.of(context).hintColor,
                  ),
                  title: Text(
                    S.of(context).most_popular,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridWidget(
                  marketsList: _con.popularMarkets,
                  heroTag: 'home_markets',
                ),
              ),

              //Recent Review
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  leading: Icon(
                    Icons.recent_actors,
                    color: Theme.of(context).hintColor,
                  ),
                  title: Text(
                    S.of(context).recent_reviews,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ReviewsListWidget(reviewsList: _con.recentReviews),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
