import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markets/src/models/gallery.dart';

import '../models/category.dart';
import '../models/route_argument.dart';

// ignore: must_be_immutable
class PromotionsCarouselItemWidget extends StatelessWidget {
  double marginLeft;
  //Category category;
  Gallery gallery;
  PromotionsCarouselItemWidget({Key key, this.marginLeft, this.gallery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).accentColor.withOpacity(0.08),
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.of(context).pushNamed('/Category', arguments: RouteArgument(id: gallery.id));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: gallery.id,
            child: Container(
              margin: EdgeInsetsDirectional.only(start: this.marginLeft, end: 20),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  //borderRadius: BorderRadius.all(Radius.circular(5)),
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Theme.of(context).focusColor.withOpacity(0.2), offset: Offset(0, 2), blurRadius: 7.0)]),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(gallery.image.url),
                  /*child: category.image.url.toLowerCase().endsWith('.svg')
                      ? SvgPicture.network(
                          category.image.url,
                          color: Theme.of(context).accentColor,
                          fit: BoxFit.fill,
                        )
                      : CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: category.image.icon,
                          placeholder: (context, url) => Image.asset(
                            'assets/img/loading.gif',
                            fit: BoxFit.cover,
                          ),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),*/
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
            margin: EdgeInsetsDirectional.only(start: this.marginLeft, end: 20),
            child: Text(
              gallery.id,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ],
      ),
    );
  }
}
