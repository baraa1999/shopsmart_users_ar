import 'package:flutter/material.dart';
import 'package:shopsmart_users_ar/consts/app_colors.dart';

class Styless {
  static ThemeData themeData(
      {required bool isDarkthme, required BuildContext context}) {
    return ThemeData(
        scaffoldBackgroundColor: isDarkthme
            ? AppColor.darkScaffoldcolor
            : AppColor.lightScaffoldcolor,
        cardColor: isDarkthme
            ? const Color.fromARGB(255, 13, 6, 37)
            : AppColor.lightCardColor,
        brightness: isDarkthme ? Brightness.dark : Brightness.light);
  }
}
