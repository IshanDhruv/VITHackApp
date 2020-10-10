import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  final String path;
  final String line1;
  final  String line2;

  Header({this.path, this.line1, this.line2,});


  @override
  
  Widget build(BuildContext context) {
      final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
    return Container(
      child: Positioned(
    bottom: 1.0,
    child: Stack(
      children: <Widget>[
        Positioned(
          left: width * 0.3,
          top: 0,
          child: SvgPicture.asset(
            "$path",
            height: 220,
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
                stops: [0.5, 0.6, 0.8],
                colors: [
                  //Colors.white.withAlpha(150),
                  Colors.grey[100].withAlpha(10),
                   Colors.grey[100].withAlpha(80),
                   Colors.grey[100].withAlpha(230),
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
                "$line1",
                style: GoogleFonts.montserrat(
                  fontSize: 30,
                ),
              ),
              Text(
                "&",
                style: GoogleFonts.montserrat(
                  fontSize: 30,
                ),
              ),
              Text(
                "$line2",
                style: GoogleFonts.montserrat(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          child: Container(
            height: height * 0.25,
            width: double.infinity,
          ),
        ),
      ],
      overflow: Overflow.visible,
    ),
  ),
    );
  }
}

