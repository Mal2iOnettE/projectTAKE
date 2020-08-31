
import 'package:flutter/material.dart';
import 'package:markets/src/elements/PromotionsCarouselItemWidget.dart';
import 'package:markets/src/models/gallery.dart';

import '../elements/CategoriesCarouselItemWidget.dart';
import '../elements/CircularLoadingWidget.dart';
import '../models/category.dart';
//import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  "http://via.placeholder.com/300"
  "http://via.placeholder.com/300"
  "http://via.placeholder.com/300"
  "http://via.placeholder.com/300"
  "http://via.placeholder.com/300"

 ];

// ignore: must_be_immutable
class PromotionsCarouselWidget extends StatelessWidget {
  List<Gallery> gallery;

  PromotionsCarouselWidget({Key key, this.gallery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
      child: Container(
         /* child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.5,
          enlargeCenterPage: false,
          scrollDirection: Axis.horizontal,
          autoPlay: false,
        ),
        items: imageSliders,
      )*/),
    );
  }

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                  ],
                )),
          ))
      .toList();
}
