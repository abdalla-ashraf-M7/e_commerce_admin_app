import 'package:admin_ecommerce/core/constants/colors.dart';
import 'package:flutter/material.dart';

ThemeData appthemeEnglish = ThemeData(
    fontFamily: "crimson",
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(fontSize: 38, color: Appcolors.white, fontWeight: FontWeight.bold, fontFamily: "crimson"),
      iconTheme: IconThemeData(color: Appcolors.white, size: 25),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Appcolors.primarycolor,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Appcolors.primarycolor),
    textTheme: const TextTheme(
        displayLarge: TextStyle(color: Appcolors.primarycolor, fontWeight: FontWeight.bold, fontSize: 30),
        bodyLarge: TextStyle(color: Appcolors.grey4, fontSize: 18, wordSpacing: 3, height: 1.4),
        labelLarge: TextStyle(color: Appcolors.white, fontSize: 22)));

ThemeData appthemeArabic = ThemeData(
    fontFamily: "cairo",
    textTheme: const TextTheme(
        displayLarge: TextStyle(color: Appcolors.primarycolor, fontWeight: FontWeight.bold, fontSize: 30),
        bodyLarge: TextStyle(color: Appcolors.grey4, fontSize: 18, wordSpacing: 3, height: 1.4),
        labelLarge: TextStyle(color: Appcolors.white, fontSize: 22)));
