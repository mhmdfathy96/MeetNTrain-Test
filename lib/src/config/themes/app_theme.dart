import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';

ThemeData appTheme() {
  return ThemeData(
      primaryColor: AppColors.primary,
      hintColor: AppColors.hint,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        shadowColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20 ,
          fontWeight: FontWeight.w500,
        ),
      ),
      brightness: Brightness.light,
      // primarySwatch: AppColors.primary,
      fontFamily: AppStrings.fontFamily,

      ///TextTheme
      textTheme: TextTheme(
        headline1: const TextStyle(
          color: Colors.black,
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
        headline2: const TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        headline3: TextStyle(
          color: AppColors.hint,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        headline4: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
         headline5: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          // fontWeight: FontWeight.w600,
        ),headline6: const TextStyle(
          color: Colors.black,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ));
}
