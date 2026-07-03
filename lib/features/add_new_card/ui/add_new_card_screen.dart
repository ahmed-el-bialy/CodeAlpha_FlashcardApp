import 'package:code_alpha_flash_card_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

import '../../home/ui/widgets/app_navigation_bar.dart';

class AddNewCardScreen extends StatelessWidget {
  const AddNewCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      extendBody: true,

      bottomNavigationBar: AppNavigationBar(activeIndex: 1),
    );
  }
}
