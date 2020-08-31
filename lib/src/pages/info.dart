import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:markets/src/pages/home.dart';
import 'package:markets/src/pages/pages.dart';
import 'package:markets/src/pages/pre_login.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => PagesWidget()), 
    );
  }

  Widget _buildImage(String assetName) {
    return Container(
      child: Stack(
        children: <Widget>[
          // heightFactor: 3.0,
          Image.asset(
            'assets/img/$assetName.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w500),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      pageColor: Color(0xFFd01f44),
      //imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [

        /// 1
        PageViewModel(
          titleWidget: Text(
            "Search and choose your favourite foods",
            style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          bodyWidget: Text(
            "Discover the best foods from over 2,000 restaruants.",
            style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.normal),
          ),
          image: _buildImage('info1'),
          footer: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Prelogin()),
                );
              },
              child: Container(
                width: 300,
                height: 50,
                child: Center(
                  child: const Text(
                    'Get Started',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          decoration: pageDecoration,
        ),


        ///2
        PageViewModel(
          titleWidget: Text("Fast delivery to your place", style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
          bodyWidget: Text(
            "Fast delivery to your home, office and wherever you are.",
            style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.normal),
          ),
          image: _buildImage('info2'),
          footer: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Prelogin()),
                );
              },
              child: Container(
                width: 300,
                height: 50,
                child: Center(
                  child: const Text(
                    'Get Started',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          decoration: pageDecoration,
        ),

        ///3
        PageViewModel(
          titleWidget: Text(
            "Track order real time",
            style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          bodyWidget: Text(
            "Real time tracking of your food on the app after ordered.",
            style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.normal),
          ),
          image: _buildImage('info4'),
          footer: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Prelogin()),
                );
              },
              child: Container(
                width: 300,
                height: 50,
                child: Center(
                  child: const Text(
                    'Get Started',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: (Colors.white),
        activeSize: Size(10.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

