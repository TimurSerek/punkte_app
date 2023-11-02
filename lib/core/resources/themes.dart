import 'package:flutter/material.dart';
import 'package:punkte_app/core/resources/colors.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    fontFamily: 'Roboto',
    shadowColor: AppColors.lightGrey,
    scaffoldBackgroundColor: Colors.white,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      linearTrackColor: AppColors.lightFadeGrey,
    ),
  );
}
