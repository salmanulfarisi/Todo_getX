import 'package:flutter/material.dart';
import 'package:todo_flutter/app/core/values/colors.dart';

class Themes {
  static final lightMode = ThemeData(
    primaryColor: primaryClr,
    brightness: Brightness.light,
  );
  static final darkMode = ThemeData(
    primaryColor: darkGreyClr,
    brightness: Brightness.dark,
  );
}
