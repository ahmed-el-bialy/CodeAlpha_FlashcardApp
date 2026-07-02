import 'package:code_alpha_flash_card_app/core/theming/app_colors.dart';
import 'package:code_alpha_flash_card_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(
                  "Revio", style: AppStyles.font24BoldIndigoAccentManrope),
              backgroundColor: AppColors.darkBackground,

            ),

            SliverToBoxAdapter(
              child: Text(
                "Card Library", style: AppStyles.font24BoldIceBlueManrope,),
            ), SliverToBoxAdapter(
              child: Text(
                "Manage and organize your study sets efficiently. Choose a set to start or create a new one.",
                style: AppStyles.font16LavenderGray,),
            ),
          ],
        ),
      )),
    );
  }
}
