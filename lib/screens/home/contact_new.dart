import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_table/json_table.dart';
//import 'package:parkinsons_detection_app/models/notification.dart';
import 'package:parkinsons_detection_app/services/api_calls.dart';
import 'package:parkinsons_detection_app/models/contact.dart';
import 'package:url_launcher/url_launcher.dart';

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height*0.04),
              child: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFF5F4EF),
          leading: IconButton(
            onPressed: () {
              //Navigator.pushNamed(context, Explore.id);
            },
            icon: Icon(
              MaterialCommunityIcons.chevron_left,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: Color(0xFFF5F4EF),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, top: height*0.02, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[],
              ),
            ),
            //SizedBox(height: 60),
            header(context, primary),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
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
                        0.3,
                        0.6,
                        0.8,
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
                child: Padding(
                  padding: const EdgeInsets.only(
                      //horizontal: 5,
                      top: 10),
                  child: ListView(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
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
                      ),
                      // Text(
                      //   "Name of Location",
                      // ),
                      SizedBox(height: 20),

                      Container(
                          // height: 200,
                          // width: 200,
                          color: Colors.transparent,
                          // curveType: CurveType.convex,
                          //width: width*0.5,
                          child: JsonTable(contact.regional,
                              tableHeaderBuilder: (String header) {
                            return Container(
                              height: 50,
                              width: width/2.2,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey[400].withOpacity(0.5),
                              ),
                              child: Text(header.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize:18,
                                      fontWeight: FontWeight.bold)),
                            );
                          }, tableCellBuilder: (value) {
                            return Container(
                                height: 50,
                                width: width/2.2,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    border: Border.symmetric(
                                        horizontal: BorderSide(width: 0.1))),
                                child: Text(
                                  value,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(color: Colors.black),
                                ));
                          })),
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

Widget header(BuildContext context, Primary primary) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return Positioned(
    bottom: 1.0,
    child: Stack(
      children: <Widget>[
        Positioned(
          left: width*0.1,
          top: 0,
          child: SvgPicture.asset(
            "assets/graphics/text-01.svg",
            height: 220,
          ),
        ),
        Positioned(
          //left: 105,
          top: -30,
          child: Container(
            height: height*0.4,
            width: width,
            // color: Colors.white.withAlpha(100),

            decoration: BoxDecoration(
              //color: Colors.white.withAlpha(100)
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                stops: [0.5, 0.6, 0.8],
                colors: [
                  //Colors.white.withAlpha(150),
                  Color(0xFFF5F4EF).withAlpha(10),
                  Color(0xFFF5F4EF).withAlpha(80),
                  Color(0xFFF5F4EF).withAlpha(230),
                  //Colors.white.withAlpha(220),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Contacts",
                style: GoogleFonts.montserrat(
                  fontSize: 30,
                ),
              ),
              Text(
                "& Helpline",
                style: GoogleFonts.montserrat(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: height*0.13,
          left: width*0.04,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Primary"),
              Text("number: ${primary.number}"),
              Text("number-tollfree ${primary.numberTollFree}"),
              Text("other handles:"),
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.email),
                      onPressed: () async {
                        await launch(primary.email);
                      }),
                      IconButton(
                      // icon: SvgPicture.asset("assets/icons/facebook-app-logo.svg", height: 20,),
                      icon: Icon(FlutterIcons.facebook_box_mco),
                      onPressed: () async {
                        await launch(primary.facebook);
                      }),
                      IconButton(
                      icon: Icon(FlutterIcons.twitter_box_mco),
                      onPressed: () async {
                        await launch(primary.twitter);
                      }),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          child: Container(
            height: height * 0.30,
            width: double.infinity,
          ),
        ),
      ],
      overflow: Overflow.visible,
    ),
  );
}
