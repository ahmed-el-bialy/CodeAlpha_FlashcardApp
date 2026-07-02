import 'package:code_alpha_flash_card_app/core/theming/app_colors.dart';
import 'package:code_alpha_flash_card_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
                "Revio", style: AppStyles.font24BoldIndigoAccentManrope),
            backgroundColor: AppColors.darkBackground,

          )
        ],
      )),
    );
  }
}
