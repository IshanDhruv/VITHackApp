import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  final String path;
  final String line1;
  final String line2;
  double heightSvg;

  Header({
    this.path,
    this.line1,
    this.line2,
    this.heightSvg
  });

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
              left: width * 0.5,
              top: 0,
              child: SvgPicture.asset(
                "$path",
                height: heightSvg,
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
                    stops: [0.1, 0.2, 0.3, 0.5],
                    colors: [
                      //Colors.white.withAlpha(150),
                      Colors.grey[100].withAlpha(10),
                      Colors.grey[100].withAlpha(60),
                      Colors.grey[100].withAlpha(130),
                      Colors.grey[100].withAlpha(210),
                      //Colors.white.withAlpha(220),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$line1",
                   style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 35,
                                              fontWeight: FontWeight.w500))
                  ),
                  Text(
                    "&",
                    style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 35,
                                              fontWeight: FontWeight.w500))
                  ),
                  Text(
                    "$line2",
                    style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 35,
                                              fontWeight: FontWeight.w500))
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
