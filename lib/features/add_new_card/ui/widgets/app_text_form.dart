import 'package:code_alpha_flash_card_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';

class AppTextForm extends StatelessWidget {
  const AppTextForm({
    super.key,
    required this.controller,
    required this.hint,
    this.validator,
    required this.maxLines,
    this.hintStyle,
    this.fillColor,
    this.textStyle,
  });

  final TextEditingController controller;
  final String hint;
  final FormFieldValidator<String>? validator;
  final int maxLines;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style:
          textStyle ??
          AppStyles.font24BoldIceBlueManrope.copyWith(fontSize: 15.sp),
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle:
            hintStyle ?? AppStyles.font16LavenderGray.copyWith(fontSize: 13.sp),
        fillColor: fillColor ?? Colors.white.withValues(alpha: 0.05),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(
            color: AppColors.indigoAccent,
            width: 1.5,
          ),
        ),
      ),
      validator: validator,
    );
  }
}
