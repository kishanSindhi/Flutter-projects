import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.patrickHand().fontFamily,
        cardColor: darkColor,
        accentColor: darkBlue,
        canvasColor: creamColor,
        dividerColor: white,
        buttonColor: darkBlue,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          textTheme: Theme.of(context).textTheme,
        ),
      );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.patrickHand().fontFamily,
        cardColor: creamColor,
        dividerColor: Colors.black87,
        accentColor: creamColor,
        canvasColor: darkColor,
        buttonColor: lightBlue,
        appBarTheme: AppBarTheme(
          color: Colors.black54,
          elevation: 0.0,
          iconTheme: IconThemeData(color: creamColor),
          textTheme: Theme.of(context).textTheme,
        ),
      );

//  colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBlue = Color(0xff403a58);
  static Color white = Color(0xffffffff);
  static Color darkColor = Vx.gray900;
  static Color lightBlue = Vx.indigo600;
}
