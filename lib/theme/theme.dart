import 'package:flutter/material.dart';

ThemeData customTheme = ThemeData.light().copyWith(
    accentColor: Colors.indigo,
    appBarTheme:
        AppBarTheme(color: Colors.indigo, centerTitle: true, elevation: 2.5),
    primaryColor: Colors.indigo,
    scaffoldBackgroundColor: Color(0xffdedede));
