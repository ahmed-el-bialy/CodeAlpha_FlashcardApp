import 'package:code_alpha_flash_card_app/core/models/card_model.dart';
import 'package:code_alpha_flash_card_app/core/theming/app_colors.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlashCard extends StatelessWidget {
  const FlashCard({super.key, required this.cardModel});

  final CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      key: ValueKey('flashcard_${cardModel.id}'),
      direction: FlipDirection.HORIZONTAL,
      side: CardSide.FRONT,
      speed: 400,

      front: Container(
        width: double.infinity,
        height: 200.h,
        decoration: BoxDecoration(
          color: AppColors.oceanBlue,
          borderRadius: BorderRadius.circular(24.r),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.all(16.w),
        child: Text(
          cardModel.front,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),

      back: Container(
        width: double.infinity,
        height: 200.h,
        decoration: BoxDecoration(
          color: AppColors.oceanBlue,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(color: AppColors.accentCyan, width: 1.5),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.all(16.w),
        child: Text(
          cardModel.back,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}