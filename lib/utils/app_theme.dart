import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteBgColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.whiteBgColor,
      selectedItemColor: AppColors.mainColor,
      unselectedItemColor: AppColors.lightGrayColor,
      selectedLabelStyle: AppStyle.regular12MainColor,
      unselectedLabelStyle: AppStyle.regular12GrayColor,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.mainColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),
    textTheme: TextTheme(
      headlineLarge: AppStyle.semi20Black,
      headlineMedium: AppStyle.regular14Gray,
      headlineSmall: AppStyle.meduim16Black,
      labelLarge: AppStyle.semi24MainColor,
      labelMedium: AppStyle.meduim16Black,
      labelSmall: AppStyle.meduim16White,
      bodyLarge: AppStyle.semi24MainColor,
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.PrimaryDarkColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.PrimaryDarkColor,
      selectedItemColor: AppColors.mainDarkColor,
      unselectedItemColor: AppColors.grayColor,
      selectedLabelStyle: AppStyle.regular12MainColor,
      unselectedLabelStyle: AppStyle.regular12GrayColor,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.mainDarkColor,
      shape: StadiumBorder(),
    ),
    textTheme: TextTheme(
      headlineLarge: AppStyle.semi20White,
      headlineMedium: AppStyle.regular14White,
      headlineSmall: AppStyle.meduim16White,
      labelLarge: AppStyle.semi24White,
      labelMedium: AppStyle.meduim16MainDarkColor,
      labelSmall: AppStyle.meduim18MainDarkColor,
      bodyLarge: AppStyle.semi14MainDarkColor,
    ),
  );
}
