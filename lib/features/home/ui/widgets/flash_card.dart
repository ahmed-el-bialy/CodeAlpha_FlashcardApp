import 'package:code_alpha_flash_card_app/core/theming/app_colors.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlashCard extends StatelessWidget {
  const FlashCard({super.key});

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      key: const ValueKey('home_flashcard_preview_key'),
      direction: FlipDirection.HORIZONTAL,
      side: CardSide.FRONT,
      speed: 400,

      front: Container(
        width: double.infinity,
        height: 250.h,
        decoration: BoxDecoration(
          color: AppColors.oceanBlue,
          borderRadius: BorderRadius.circular(24.r),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.all(16.w),
        child: const Text(
          "What is Clean Architecture?",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),

      back: Container(
        width: double.infinity,
        height: 250.h,
        decoration: BoxDecoration(
          color: AppColors.oceanBlue,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(color: AppColors.accentCyan, width: 1.5),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.all(16.w),
        child: const Text(
          "An architectural pattern that isolates the core business logic from the UI, database, and external frameworks.",

          style: TextStyle(color: Colors.white, fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
