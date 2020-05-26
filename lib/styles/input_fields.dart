import 'package:flutter/material.dart';
import 'package:phrazer_new/styles/colors.dart';

const InputDecorationThemeStyle = InputDecorationTheme(
  labelStyle: TextStyle(color: LightGray),
  hintStyle: TextStyle(color: LightGray),
  helperStyle: TextStyle(color: LightGray),
  errorStyle: TextStyle(color: Orange),
  contentPadding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 2.0, color: LightGray),
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 2.0, color: LightGray),
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 2.0, color: Orange),
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 2.0, color: Orange),
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
);
