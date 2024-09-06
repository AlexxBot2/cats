import 'package:cats/core/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData defaultTheme = ThemeData(
      fontFamily: 'Montserrat',
      primaryColor: AppColor.primaryColor,
      scaffoldBackgroundColor: AppColor.backgroundColor,
      primarySwatch: AppColor.primaryWatchColor,
      textTheme: const TextTheme(
          bodyMedium: normalTextStyle,
          bodySmall: smallTextStyle,
          titleMedium: titleTextStyle));

  static const smallTextStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColor.textColor,
      fontFamily: 'Montserrat');

  static const normalTextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColor.textColor,
      fontFamily: 'Montserrat');

  static const titleTextStyle = TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w700,
      color: AppColor.accentColor,
      fontFamily: 'Montserrat');
}