import 'package:flutter/material.dart';
import 'package:phrazer_new/styles/colors.dart';
import 'package:toast/toast.dart';

toastMessage(BuildContext context, String message) {
  Toast.show(message, context,
      duration: Toast.LENGTH_LONG,
      gravity: Toast.BOTTOM,
      backgroundColor: LightGray,
      textColor: DarkGreen);
}
