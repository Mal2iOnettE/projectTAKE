import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:markets/src/repository/settings_repository.dart';

import '../helpers/helper.dart';
import '../models/product.dart';
import '../models/route_argument.dart';

class ProductsCarouselItemWidget extends StatelessWidget {
  final double marginLeft;
  final Product product;
  final String heroTag;

  ProductsCarouselItemWidget({Key key, this.heroTag, this.marginLeft, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).accentColor.withOpacity(0.08),
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.of(context).pushNamed('/Product', arguments: RouteArgument(id: product.id, heroTag: heroTag));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: <Widget>[
              Hero(
                tag: heroTag + product.id,
                child: Container(
                  margin: EdgeInsetsDirectional.only(start: this.marginLeft, end: 10),
                  width: 130,
                  height: 130,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: product.image.thumb,
                      placeholder: (context, url) => Image.asset(
                        'assets/img/loading.gif',
                        fit: BoxFit.cover,
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              // Container(
              //   margin: EdgeInsetsDirectional.only(end: 25, top: 5),
              //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              //   decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(100)), color: Theme.of(context).accentColor),
              //   alignment: AlignmentDirectional.topEnd,
              //   child: Helper.getPrice(
              //     product.price,
              //     context,
              //     style: Theme.of(context).textTheme.bodyText1.merge(TextStyle(color: Theme.of(context).primaryColor)),
              //   ),
              // ),
            ],
          ),
          SizedBox(height: 5),
          Container(
              width: 115,
              margin: EdgeInsetsDirectional.only(start: this.marginLeft, end: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.product.name,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Row(
                    children: [
                      Helper.getPrice(
                      product.price,
                      context,
                      style: Theme.of(context).textTheme.headline5.merge(TextStyle(color: Theme.of(context).accentColor)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:8.0,top: 3),
                        child: product.discountPrice > 0
                            ? Helper.getPrice(product.discountPrice, context,
                                style: Theme.of(context).textTheme.bodyText2.merge(TextStyle(decoration: TextDecoration.lineThrough)))
                            : SizedBox(height: 0),
                      ),
                    ],
                  ),
                  
             

                ],
              )),
        ],
      ),
    );
  }
}
