import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class MyThemeData {

  static ThemeData lightTheme = ThemeData(
    primaryColor: colorBlue,
    scaffoldBackgroundColor: colorGreen,
    appBarTheme:
        const AppBarTheme(backgroundColor: Colors.transparent,
           iconTheme: IconThemeData(color: Colors.white)),
    textTheme: const TextTheme(
        headline1: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
      headline2: TextStyle(color: colorBlue, fontSize: 24 , fontWeight: FontWeight.normal),
      headline3: TextStyle(color: colorBlack , fontSize:  25, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(color: colorBlack, fontSize: 20 , fontWeight: FontWeight.normal),
    ),
    dividerColor: colorGold,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: colorBlue,
      unselectedItemColor: Colors.grey,
    ),
    iconTheme: IconThemeData(
      color: colorGold,
    ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorBlue,

      ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
  );
}
