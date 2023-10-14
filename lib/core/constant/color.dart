import 'package:flutter/material.dart';

class AppColor {
  static const Color grey = Color(0xff8e8e8e);
  static const Color grey2 = Color.fromARGB(255, 66, 66, 66);
  static const Color black = Color(0xff000000);
  /////////////////////////////////////////////
  static const Color backgroundcolor = Color.fromARGB(255, 248, 248, 253);
  static const Color primaryColor = Color.fromARGB(255, 71, 68, 114);
  // Color.fromARGB(255, 60, 12, 231);
  static const Color secondColor = Color.fromARGB(255, 43, 83, 192);
  static const Color thirdColor = Color.fromARGB(255, 170, 193, 255);
  static const Color fourthColor = Color.fromARGB(255, 38, 47, 175);
  static const Color fifthColor = Color.fromARGB(255, 0, 141, 35);

///////////////////////////////
  static Color gradientdeepblue1 = const Color.fromARGB(255, 101, 112, 197);
  static Color gradientdeepblue2 = const Color.fromARGB(255, 71, 68, 114);
  //   static Color gradientdeepblue1 = const Color(0xFF2E335A);
  // static Color gradientdeepblue2 = const Color(0xFF1C1B33);

  static Color gradientWhite = const Color.fromARGB(255, 255, 255, 255);
  static Color gradientprimary =
      gradientdeepblue2.withBlue(150).withOpacity(0.3);
  static List<Color> gradient = [
    AppColor.gradientWhite,
    AppColor.gradientprimary,
    AppColor.gradientWhite,
    AppColor.gradientWhite,
    AppColor.gradientprimary,
    AppColor.gradientWhite,
    AppColor.gradientWhite,
    AppColor.gradientprimary,
    AppColor.gradientWhite,
    AppColor.gradientWhite,
    AppColor.gradientprimary,
    AppColor.gradientWhite,
    AppColor.gradientWhite,
    // AppColor.gradientWhite,
  ];
}
