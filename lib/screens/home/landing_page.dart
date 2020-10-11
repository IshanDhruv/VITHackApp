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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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
              color: Color(0xffE28725),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/graphics/landing-01.svg',
                    width: width * 0.8,
                  ),
                  SizedBox(height: 50),
                  Text(
                    "The Graphs tab implements our custom API to plot a bar graph. It shows the covid tally per day.",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: Color(0xff468AA3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/graphics/hospital-01.svg', height: height*0.4),
                  SizedBox(height: 50),
                  Text(
                    "The 'Hospitals' tab contains the beds and medical colleges data in a paginated tabular form. Filters for columns make searching faster and easier.",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.teal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/graphics/notifications-01.svg', height: height*0.4),
                  SizedBox(height: 50),
                  Text(
                    "Get all the latest updates for COVID-19 in the notifications tab.",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: Color(0xffA41D37),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset('assets/graphics/contacts-02.svg', width: width*0.7),
                  SizedBox(height: 50),
                  Text(
                    "The contacts page is like a little handybook in your pocket that contains all the number of connecting to the authorities of your state.",
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
