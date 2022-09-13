import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wsmco_task/core/themes/theme_constants.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Tajawal',
  appBarTheme: const AppBarTheme(backgroundColor: kPrimaryColor),
    brightness: Brightness.light,
    primaryColor: kPrimaryColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: kAccentColor
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0)
            ),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0))
            ),
            backgroundColor: MaterialStateProperty.all<Color>(kAccentColor)
        )
    ),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),borderSide: BorderSide.none
        ),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1)
    ),
    //backgroundColor: kPrimaryColor,
    scaffoldBackgroundColor: kPrimaryColor,
);