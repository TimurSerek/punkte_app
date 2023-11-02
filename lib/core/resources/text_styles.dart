import 'package:flutter/material.dart';

import 'colors.dart';

class AppFonts {
  static const roboto = 'Roboto';

  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const semiBold = FontWeight.w600;
  static const bold = FontWeight.w700;
}

class AppTextStyles {
  static const double size10 = 10.0;
  static const double size11 = 11.0;
  static const double size12 = 12.0;
  static const double size13 = 13.0;
  static const double size14 = 14.0;
  static const double size15 = 15.0;
  static const double size16 = 16.0;
  static const double size18 = 18.0;
  static const double size20 = 20.0;
  static const double size24 = 24.0;

  static const size12RegularRoboto = TextStyle(
    fontSize: AppTextStyles.size12,
    fontWeight: AppFonts.regular,
    color: AppColors.lightFadeGrey,
    fontFamily: AppFonts.roboto,
  );

  static const size12RegularRobotoBlack = TextStyle(
    fontSize: AppTextStyles.size12,
    fontWeight: AppFonts.regular,
    color: AppColors.black,
    fontFamily: AppFonts.roboto,
  );

  static const size10MediumRoboto = TextStyle(
    fontSize: AppTextStyles.size10,
    fontWeight: AppFonts.medium,
    color: AppColors.black,
    fontFamily: AppFonts.roboto,
  );

  static const size10BoldRoboto = TextStyle(
    fontSize: AppTextStyles.size10,
    fontWeight: AppFonts.bold,
    color: AppColors.white,
    fontFamily: AppFonts.roboto,
  );

  static const size10RegularRoboto = TextStyle(
    fontSize: AppTextStyles.size10,
    fontWeight: AppFonts.regular,
    color: AppColors.black,
    fontFamily: AppFonts.roboto,
  );

  static const size11MediumRoboto = TextStyle(
    fontSize: AppTextStyles.size11,
    fontWeight: AppFonts.medium,
    color: AppColors.greenConnectorStatus,
    fontFamily: AppFonts.roboto,
  );

  static const size11MediumRobotoGrey = TextStyle(
    fontSize: AppTextStyles.size11,
    fontWeight: AppFonts.medium,
    color: AppColors.lightFadeGrey,
    fontFamily: AppFonts.roboto,
  );

  static const size16BoldRoboto = TextStyle(
    fontSize: AppTextStyles.size16,
    fontWeight: AppFonts.bold,
    color: AppColors.black,
    fontFamily: AppFonts.roboto,
  );

  static const size20MediumRoboto = TextStyle(
    fontSize: AppTextStyles.size20,
    fontWeight: AppFonts.medium,
    color: AppColors.black,
    fontFamily: AppFonts.roboto,
  );

  static const size15BoldRoboto = TextStyle(
    fontSize: AppTextStyles.size15,
    fontWeight: AppFonts.bold,
    color: AppColors.black,
    fontFamily: AppFonts.roboto,
  );

  static const size15RegularRoboto = TextStyle(
    fontSize: AppTextStyles.size15,
    fontWeight: AppFonts.regular,
    color: AppColors.black,
    fontFamily: AppFonts.roboto,
  );

  static const size15RegularRobotoFGrey = TextStyle(
    fontSize: AppTextStyles.size15,
    fontWeight: AppFonts.regular,
    color: AppColors.lightFadeGrey,
    fontFamily: AppFonts.roboto,
  );

  static const size18MediumRoboto = TextStyle(
    fontSize: AppTextStyles.size18,
    fontWeight: AppFonts.medium,
    color: AppColors.black,
    fontFamily: AppFonts.roboto,
  );

  static const size13MediumRobotoFGrey = TextStyle(
    fontSize: AppTextStyles.size13,
    fontWeight: AppFonts.medium,
    color: AppColors.lightFadeGrey,
    fontFamily: AppFonts.roboto,
  );

  static const size13MediumRobotoBlack = TextStyle(
    fontSize: AppTextStyles.size13,
    fontWeight: AppFonts.medium,
    color: AppColors.black,
    fontFamily: AppFonts.roboto,
  );

  static const size24RegularRoboto = TextStyle(
    fontSize: AppTextStyles.size24,
    fontWeight: AppFonts.regular,
    color: AppColors.black,
    fontFamily: AppFonts.roboto,
  );
}
