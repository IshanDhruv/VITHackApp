import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_table/json_table.dart';
import 'package:parkinsons_detection_app/models/notification.dart';
//import 'package:parkinsons_detection_app/models/notification.dart';
import 'package:parkinsons_detection_app/services/api_calls.dart';
import 'package:parkinsons_detection_app/widgets/header.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationNew extends StatefulWidget {
  static String id = "details";

  @override
  _NotificationNewState createState() => _NotificationNewState();
}

class _NotificationNewState extends State<NotificationNew>{
  APICalls apiCalls = APICalls();
  NotificationClass notification;
  bool _isLoading = true;
  // TabController _controller;

  @override
  void initState() {
    getNotifications();
    super.initState();
    //  _controller = new TabController(length: 2, vsync: this);
  }


  getNotifications() async {
    setState(() {
      _isLoading = true;
    });
    notification = await apiCalls.getNotifications();
    print(notification.notifications[0]['title']);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
          child: Scaffold(
        
        body: _isLoading == true
            ? Container(
                color: Colors.grey[100],
                //Color(0xFFF5F4EF),

                height: height,
                width: width,
                child: Center(child: CircularProgressIndicator()))
            : Container(
                width: double.infinity,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  //  Color(0xFFF5F4EF),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20, top: height * 0.02, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[],
                      ),
                    ),
                    //SizedBox(height: 60),
                    Header(
                      path: "assets/graphics/notifications-01.svg",
                      heightSvg: height*0.3,
                      line1: "Notifications",
                      line2: "Advisories",
                    ),

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
                              blurRadius: 5.0, // soften the shadow
                              spreadRadius: 1.0, //extend the shadow
                              offset: Offset(
                                4.0, // Move to right 10  horizontally
                                4.0, // Move to bottom 10 Vertically
                              ),
                            ),
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 5.0, // soften the shadow
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
                              
                              SizedBox(height: 10),
              //                 Center(
              //                   child: TabBar(controller: _controller,
              // indicatorColor: Colors.transparent,
              // labelColor: Colors.black,
              // unselectedLabelColor: Colors.grey.withOpacity(0.5),
              // isScrollable: true,
              //                     tabs: <Widget>[
              //                        Tab(
              //       child: Text(
              //         'Table Format',
              //         style: TextStyle(
              //             fontSize: 17.0,
              //             fontFamily: 'Montserrat',
              //             fontWeight: FontWeight.bold),
              //       ),
              //     ),
              //     Tab(
              //       child: Text(
              //         'Button Format',
              //         style: TextStyle(
              //             fontSize: 17.0,
              //             fontFamily: 'Montserrat',
              //             fontWeight: FontWeight.bold),
              //       ),),

              //                     ],),
              //                 ),
                              SizedBox(height: 10),

                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50)),
                                  child: JsonTable(notification.notifications,
                                  paginationRowCount: 8,
                                      tableHeaderBuilder: (String header) {
                                    return ClayContainer(
                                      height: height * 0.065,
                                      width: width / 2.1,
                                     depth: 60,
                                      child: Center(
                                        child: ClayText(header.toUpperCase(),
                                            emboss: true,
                                             style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 19,
                                                fontWeight: FontWeight.w500)),),
                                      ),
                                    );
                                  }, tableCellBuilder: (value) {
                                    return Container(
                                        height: height * 0.15,
                                        width: width / 2.1,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        decoration: BoxDecoration(
                                            border: Border.symmetric(
                                                horizontal:
                                                    BorderSide(width: 0.1))),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                                                                  child: Text(
                                            value,
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 14.5,
                                                fontWeight: FontWeight.w400))
                                          ),
                                        ));
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

