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
      style: textStyle ?? TextStyle(color: Colors.white),
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle:
            hintStyle ?? TextStyle(color: Colors.white.withValues(alpha: 0.3)),
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
