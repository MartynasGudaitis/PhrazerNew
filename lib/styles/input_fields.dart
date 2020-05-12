import 'package:flutter/material.dart';
import 'package:phrazer_new/styles/colors.dart';

const InputDecorationThemeStyle = InputDecorationTheme(
  hintStyle: TextStyle(color: LightGray),
  contentPadding: EdgeInsets.only(left: 25.0, top: 15.0, bottom: 15.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 2.0, color: LightGray),
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 2.0, color: LightGray),
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
);
