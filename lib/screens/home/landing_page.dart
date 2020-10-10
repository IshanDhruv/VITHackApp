import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../wrapper.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool showLanding;

  Future getStarted() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    bool result = _prefs.getBool('started');
    if (result == null) {
      print('1st time');
      setState(() {
        showLanding = true;
      });
    } else
      setState(() {
        showLanding = false;
      });
  }

  @override
  void initState() {
    getStarted();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PageController _pageController =
        PageController(initialPage: 0, keepPage: true);
    GlobalKey<PageContainerState> _pageKey = GlobalKey();

    if (showLanding == true)
      return Scaffold(
          body: PageIndicatorContainer(
        key: _pageKey,
        align: IndicatorAlign.bottom,
        length: 4,
        indicatorSpace: 10,
        indicatorSelectorColor: Colors.black,
        child: PageView(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/graphics/text-01.svg',
                    height: 200,
                  ),
                  SizedBox(height: 50),
                  Text(
                    "The first page is where we have implemented the custom API as a bar graph. It shows the covid tally per day.",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.orange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/graphics/text-01.svg', height: 200),
                  SizedBox(height: 50),
                  Text(
                    "The second page is where you can find the beds and medical colleges data in tabular form. We have provided some filters to make searching easier.",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/graphics/text-01.svg', height: 200),
                  SizedBox(height: 50),
                  Text(
                    "The third page is the notifications page where you can get all the latest updates.",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.purple,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset('assets/graphics/text-01.svg', height: 200),
                  SizedBox(height: 50),
                  Text(
                    "Finally, the last page is the contact us page where you can find all the ways to contact the authorities.",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 50),
                  IconButton(
                    icon: Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setBool('started', true);
                      setState(() {
                        showLanding = false;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ));
    else
      return Wrapper();
  }
}
