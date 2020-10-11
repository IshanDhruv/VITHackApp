import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_table/json_table.dart';
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

    return SafeArea(
          child: Scaffold(
        body: _isLoading == true?Container(
          color:Colors.grey[100], 
          // Color(0xFFF5F4EF),
          child: 
        Center(
          child: CircularProgressIndicator())): Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
            color:Colors.grey[100], 
            // Color(0xFFF5F4EF),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20, top: height * 0.02, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[],
                ),
              ),

              headerContacts(context, primary),

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
                        // Text(
                        //   "Name of Location",
                        // ),
                        SizedBox(height: height*0.01),

                        Center(
                          child: ClipRRect(
                            
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)

                            ),
                              
                              child: JsonTable(contact.regional,
                                  tableHeaderBuilder: (String header) {
                                return Padding(
                                  padding: EdgeInsets.only(top:8.0),
                                  child: ClayContainer(
                                    height: height*0.065,
                                    width: width / 2.1,
                                    depth: 60,
                                      child: Center(
                                        child: ClayText(header.toUpperCase(),
                                            // textAlign: TextAlign.center,
                                            emboss: true,
                                            style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 19,
                                                fontWeight: FontWeight.w500)),),
                                      ),
                                    ),
                                  
                                );
                              }, tableCellBuilder: (value) {
                                return Container(
                                    height: 50,
                                    width: width / 2.1,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    decoration: BoxDecoration(
                                        border: Border.symmetric(
                                            horizontal: BorderSide(width: 0.1))),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        value,
                                        // textAlign: TextAlign.start,
                                        style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 14.5,
                                                fontWeight: FontWeight.w400)),
                                      ),
                                    ));
                              })),
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

Widget headerContacts(BuildContext context, Primary primary) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return Positioned(
    bottom: 1.0,
    child: Stack(
      children: <Widget>[
        Positioned(
          left: width * 0.45,
          top: -(height*0.05),
          child: SvgPicture.asset(
            "assets/graphics/contacts-02.svg",
            height: height*0.4,
          ),
        ),
        Positioned(
          //left: 105,
          top: -30,
          child: Container(
            height: height * 0.4,
            width: width,
            // color: Colors.white.withAlpha(100),

            decoration: BoxDecoration(
              //color: Colors.white.withAlpha(100)
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                stops: [0.2, 0.4, 0.5, 0.6,],
                colors: [
                  //Colors.white.withAlpha(150),
                  Colors.grey[100].withAlpha(80),
                  Colors.grey[100].withAlpha(120),
                  Colors.grey[100].withAlpha(180),
                  Colors.grey[100].withAlpha(220),
                  //Colors.white.withAlpha(220),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: width*0.03,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(

                "Contacts",
                style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 40,
                                              fontWeight: FontWeight.w500)),
                
              ),
              Text(
                "& Helpline",
                style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 35,
                                              fontWeight: FontWeight.w500)),
                ),
                
              
            ],
          ),
        ),
        Positioned(
          top: height * 0.16,
          left: width * 0.04,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("PRIMARY", style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600)),),
              Text("number: ${primary.number}", style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 15.5,
                                              fontWeight: FontWeight.w500)),),
              Text("number-tollfree: ${primary.numberTollFree}", style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 15.5,
                                              fontWeight: FontWeight.w500)),),
              Text("other handles:", style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 15.5,
                                              fontWeight: FontWeight.w500)),),
              Row(
                children: [
                  IconButton(
                    
                      icon: Icon(Icons.email, size: 32,),
                      onPressed: () async {
                        await launch(primary.email);
                      }),
                  IconButton(
                      // icon: SvgPicture.asset("assets/icons/facebook-app-logo.svg", height: 20,),
                      icon: Icon(FlutterIcons.facebook_box_mco, size: 32,),
                      onPressed: () async {
                        await launch(primary.facebook, );
                      }),
                  IconButton(
                      icon: Icon(FlutterIcons.twitter_box_mco, size: 32,),
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
            height: height * 0.35,
            width: double.infinity,
          ),
        ),
      ],
      overflow: Overflow.visible,
    ),
  );
}
