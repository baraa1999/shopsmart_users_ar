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
        brightness: isDarkthme ? Brightness.dark : Brightness.light,
        appBarTheme: AppBarTheme(
            iconTheme:
                IconThemeData(color: isDarkthme ? Colors.white : Colors.black),
            backgroundColor: isDarkthme
                ? AppColor.darkScaffoldcolor
                : AppColor.lightScaffoldcolor,
            elevation: 0,
            centerTitle: false,
            titleTextStyle:
                TextStyle(color: isDarkthme ? Colors.white : Colors.black)));
  }
}
