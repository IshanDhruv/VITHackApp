import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_table/json_table.dart';
import 'package:parkinsons_detection_app/models/beds.dart';
import 'package:parkinsons_detection_app/models/medical_colleges.dart';
import 'package:parkinsons_detection_app/models/notification.dart';
//import 'package:parkinsons_detection_app/models/notification.dart';
import 'package:parkinsons_detection_app/services/api_calls.dart';
import 'package:parkinsons_detection_app/widgets/header.dart';
import 'package:url_launcher/url_launcher.dart';

class MedicalCollegesNew extends StatefulWidget {
  static String id = "details";

  @override
  _MedicalCollegesNewState createState() => _MedicalCollegesNewState();
}

class _MedicalCollegesNewState extends State<MedicalCollegesNew>{
  APICalls apiCalls = APICalls();
  bool _isLoading = true;
  MedicalColleges medicalColleges;
  List colleges;
  List collegesJson;
  List states = ['Choose a state'];
  String state = 'Choose a state';

  @override
  void initState() {
    getMedicalColleges();
    super.initState();
  }

  getMedicalColleges() async {
    setState(() {
      _isLoading = true;
    });
    medicalColleges = await apiCalls.getMedicalColleges();
    colleges = medicalColleges.medicalColleges;
    getStates();
    setState(() {
      _isLoading = false;
    });
  }

  getStates() {
    colleges.forEach((element) {
      if (!states.contains(element['state'])) states.add(element['state']);
    });
    print(states);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return  _isLoading == true
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
                    path: "assets/graphics/text-01.svg",
                    line1: "Med Colleges",
                    line2: "Beds",
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
                            // SizedBox(height: 10),

                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50)),
                                child: JsonTable(

                        colleges,
                        paginationRowCount: 10,
                          tableHeaderBuilder: (String header) {
                        return Container(
                          height: height*0.06,
                          width: width/3,
                          
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey[300].withOpacity(1),
                          ),
                          child: Text(header.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)),
                        );
                      }, tableCellBuilder: (value) {
                        return Container(
                           height: height*0.06,
                          width: width/3,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                                border: Border.symmetric(
                                    horizontal: BorderSide(width: 0.1))),
                            child: Text(
                              value,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.blue[500], fontSize: 16),
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
    );
  }
}

