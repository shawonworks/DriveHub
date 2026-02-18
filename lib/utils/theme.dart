import 'package:flutter/material.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeDataLight = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  useMaterial3: true,
  textTheme: GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme.apply(bodyColor: ConstColor.textColor, displayColor: ConstColor.textColor)),
  colorSchemeSeed: ConstColor.primaryColor,
  appBarTheme: AppBarTheme(backgroundColor: ConstColor.white, surfaceTintColor: ConstColor.white, centerTitle: true),
);
