import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/theming/app_colors.dart';

class ManageCardsScreen extends StatelessWidget {
  const ManageCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.transparent,
        title: Text(
          "Manage Cards",
          style: TextStyle(color: AppColors.indigoAccent, fontSize: 19.sp),
        ),
        centerTitle: true,
      ),
    );
  }
}
