import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/category.dart';
import '../models/route_argument.dart';

// ignore: must_be_immutable
class CategoriesCarouselItemWidget extends StatelessWidget {
  double marginLeft;
  Category category;
  CategoriesCarouselItemWidget({Key key, this.marginLeft, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).accentColor.withOpacity(0.08),
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.of(context).pushNamed('/Category', arguments: RouteArgument(id: category.id));
      },
      child: Container(
        height: 150.0,
        child: Column(
          children: <Widget>[
            Hero(
              tag: category.id,
              child: Container(
                margin: EdgeInsetsDirectional.only(start: this.marginLeft, end: 10.0, bottom: 10.0),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    //borderRadius: BorderRadius.all(Radius.circular(5)),
                    shape: BoxShape.rectangle,
                    boxShadow: [BoxShadow(color: Theme.of(context).focusColor.withOpacity(0.2), offset: Offset(0, 2), blurRadius: 7.0)]),
                child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        category.image.url,
                        height: 150.0,
                        width: 100.0,
                      ),
                    )

                    //  child: CircleAvatar(
                    //  backgroundImage: NetworkImage(category.image.url),
                    // backgroundColor: Theme.of(context).accentColor,
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
                    //  ),
                    ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: 80.0,
              margin: EdgeInsetsDirectional.only(start: this.marginLeft, end: 0.0),
              child: Text(
                category.name,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
