import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:markets/src/pages/home.dart';
import 'package:markets/src/pages/pages.dart';

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
      width: MediaQuery.of(context).size.width,
      child: Image.network("https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-1.2.1&auto=format&fit=crop&w=653&q=80",
          fit: BoxFit.cover),
      //child: Image.asset('assets/img/loading_card.png', width: 1500,height: 2000.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 0.0),
      pageColor: Color(0xFFd01f44),
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        //1
        PageViewModel(
          titleWidget: Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Search and choose your favourite foods",
                    style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
              ],
            ),
          ),
          bodyWidget: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Discover the best foods from over 2,000 reaturants.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          image: _buildImage('info1'),
          footer: Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: RaisedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/PreLogin');
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

        //2
        PageViewModel(
          titleWidget: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Fast delivery to your place",
                    style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
              ],
            ),
          ),
          bodyWidget: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Fast delivery to your home, office and wherever you are.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          image: _buildImage('info1'),
          footer: Padding(
            padding: const EdgeInsets.only(top: 83.0),
            child: RaisedButton(
              onPressed: () {
                 Navigator.pushReplacementNamed(context, '/PreLogin');
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

        //3
        PageViewModel(
          titleWidget: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Track order real time",
                    style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
              ],
            ),
          ),
          bodyWidget: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Real time tracking of your food on the app after ordered.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          image: _buildImage('info1'),
          footer: Padding(
            padding: const EdgeInsets.only(top: 83.0),
            child: RaisedButton(
              onPressed: () {
                 Navigator.pushReplacementNamed(context, '/PreLogin');
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
        color: Color(0xFFFFFFFF),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
