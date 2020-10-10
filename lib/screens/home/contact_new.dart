import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:json_table/json_table.dart';
//import 'package:parkinsons_detection_app/models/notification.dart';
import 'package:parkinsons_detection_app/services/api_calls.dart';
import 'package:parkinsons_detection_app/models/contact.dart';

class ContactNew extends StatefulWidget {
  static String id = "details";

  @override
  _ContactNewState createState() => _ContactNewState();
}

class _ContactNewState extends State<ContactNew> {
  APICalls apiCalls = APICalls();

  Contact contact;
  Primary primary;
  bool _isLoading = true;

  @override
  void initState() {
    getContactInfo();
    super.initState();
  }

  getContactInfo() async {
    setState(() {
      _isLoading = true;
    });
    contact = await apiCalls.getContactInformation();
    primary = contact.primary;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: 
          Color(0xFFF5F4EF),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () {
                          //Navigator.pushNamed(context, Explore.id);
                        },
                        icon: Icon(MaterialCommunityIcons.chevron_left)),
                  ),
                ],
              ),
            ),
            //SizedBox(height: 60),
            Container(
              child: header(context),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  // color: Colors.white,
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.grey[100],
                        Colors.grey[200],
                        Colors.grey[300],
                        Colors.grey[300]
                      ],
                      stops: [
                        0.1,
                        0.3,
                        0.7,
                        0.9
                      ]),

                  boxShadow: [
                    //background color of box
                    BoxShadow(
                      color: Colors.grey[600],
                      blurRadius: 15.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                      offset: Offset(
                        4.0, // Move to right 10  horizontally
                        4.0, // Move to bottom 10 Vertically
                      ),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 15.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                      offset: Offset(
                        -4.0, // Move to right 10  horizontally
                        -4.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child: 
                    Padding(
                      padding: const EdgeInsets.only(
                          //horizontal: 5,
                           top: 10),
                      child: ListView(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: ClayContainer(
                              height: 10,
                              width: 100,
                              emboss: true,
                              curveType: CurveType.none,
                              depth: 50,
                              spread: 3,
                              borderRadius: 10,
                            ),
                          ),
                          // Text(
                          //   "Name of Location",
                          // ),
                          SizedBox(height: 30),

                          ClayContainer(
                              //color: Colors.transparent,
                              curveType: CurveType.convex,
                              width: width*0.5,
                              child: JsonTable(contact.regional,
                                  tableCellBuilder: (value) {
                                return Container(
                                    padding: EdgeInsets.symmetric(
                                        // horizontal: 4.0,
                                         vertical: 2.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            //width: 0.5,
                                            color:
                                                Colors.transparent)),
                                    child: Text(
                                      value,
                                      textAlign: TextAlign.center,
                                      // style: 
                                      // TextStyle(color: Colors.blue[500]),
                                    )
                                    );
                              }))
                        ],
                      ),
                    ),
                  
              ),
            ),
          ],
        ),
      ),
    );
  }
}


Widget header(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return Positioned(
    bottom: 1.0,
    child: Stack(
      children: <Widget>[
        Positioned(
          left: 135,
          top: 0,
          child: SvgPicture.asset(
            "assets/onboarding1.svg",
            height: 220,
          ),
        ),
        Positioned(
          //left: 105,
          top: -30,
          child: Container(
            height: 230,
            width: width,
            // color: Colors.white.withAlpha(100),

            decoration: BoxDecoration(
              //color: Colors.white.withAlpha(100)
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                //stops: [0.05, 0.99],
                colors: [
                  //Colors.white.withAlpha(150),
                  Colors.grey[50].withAlpha(10),
                  // Colors.white.withAlpha(70),
                  // Colors.white.withAlpha(60),
                  //Colors.grey[50].withAlpha(70),
                  Colors.grey[50].withAlpha(70),
                  Colors.white.withAlpha(150),
                  //Colors.white.withAlpha(220),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 17,
          child: Text(
            "Notifications",
          ),
        ),
        Positioned(
          child: Container(
            height: height * 0.23,
            width: double.infinity,
          ),
        ),
      ],
      overflow: Overflow.visible,
    ),
  );
}
