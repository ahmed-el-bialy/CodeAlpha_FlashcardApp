

import 'package:code_alpha_flash_card_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static  TextStyle font24BoldIndigoAccentManrope = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    fontFamily: "Manrope",
    color: AppColors.indigoAccent,
  );
  static TextStyle font24BoldIceBlueManrope = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    fontFamily: "Manrope",
    color: AppColors.iceBlue,
  );
  static TextStyle font16LavenderGray = TextStyle(
    fontSize: 16.sp,
    color: AppColors.lavenderGray,
  );
  static TextStyle font14Gray = TextStyle(
    fontSize: 14.sp,
    color: AppColors.gray,
  );
  static TextStyle font17WhiteBold = TextStyle(
    fontSize: 17.sp,
    color: Colors.white,
  );
}
