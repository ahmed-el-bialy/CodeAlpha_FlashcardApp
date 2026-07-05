import 'package:code_alpha_flash_card_app/core/models/card_model.dart';
import 'package:code_alpha_flash_card_app/core/theming/app_colors.dart';
import 'package:code_alpha_flash_card_app/core/theming/app_styles.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlashCard extends StatelessWidget {
  final CardModel cardModel;
  final bool isInQuiz;

  const FlashCard({super.key, required this.cardModel, required this.isInQuiz});

  @override
  Widget build(BuildContext context) {
    final double cardHeight = 220.h;

    return FlipCard(
      key: ValueKey('flashcard_${cardModel.id}'),
      direction: FlipDirection.HORIZONTAL,
      side: CardSide.FRONT,
      speed: 400,

      front: Stack(
        children: [
          Container(
            width: double.infinity,
            height: cardHeight,
            decoration: BoxDecoration(
              color: AppColors.oceanBlue,
              borderRadius: BorderRadius.circular(24.r),
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 44.h),
            child: Text(
              cardModel.front,
              style: AppStyles.font24BoldIceBlueManrope.copyWith(
                color: Colors.white,
                fontSize: 20.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          if (!isInQuiz) ...[
            Positioned(
              top: 8.h,
              left: 8.w,
              child: IconButton(
                onPressed: () {
                  /// TODO: Edit Card
                },
                icon: Icon(
                  CupertinoIcons.pencil_circle_fill,
                  color: AppColors.indigoAccent.withValues(alpha: 0.8),
                  size: 28.sp,
                ),
              ),
            ),
            Positioned(
              top: 8.h,
              right: 8.w,
              child: IconButton(
                onPressed: () {
                  /// TODO: Delete Card
                },
                icon: Icon(
                  CupertinoIcons.trash_circle_fill,
                  color: Colors.redAccent.withValues(alpha: 0.8),
                  size: 28.sp,
                ),
              ),
            ),
          ],

          Positioned(
            bottom: 12.h,
            right: 12.w,
            child: IconButton(
              onPressed: () {
                /// TODO: Speak Card
              },
              icon: Icon(
                CupertinoIcons.speaker_2_fill,
                color: AppColors.lavenderGray.withValues(alpha: 0.6),
                size: 22.sp,
              ),
            ),
          ),
        ],
      ),

      back: Stack(
        children: [
          Container(
            width: double.infinity,
            height: cardHeight,
            decoration: BoxDecoration(
              color: AppColors.oceanBlue,
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(
                color: AppColors.accentCyan.withValues(alpha: 0.5),
                width: 1.5,
              ),
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 44.h),
            child: Text(
              cardModel.back,
              style: AppStyles.font16LavenderGray.copyWith(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          if (!isInQuiz) ...[
            Positioned(
              top: 8.h,
              left: 8.w,
              child: IconButton(
                onPressed: () {
                  /// TODO: Edit Card
                },
                icon: Icon(
                  CupertinoIcons.pencil_circle_fill,
                  color: AppColors.indigoAccent.withValues(alpha: 0.8),
                  size: 26.sp,
                ),
              ),
            ),
            Positioned(
              top: 8.h,
              right: 8.w,
              child: IconButton(
                onPressed: () {
                  /// TODO: Delete Card
                },
                icon: Icon(
                  CupertinoIcons.trash_circle_fill,
                  color: Colors.redAccent.withValues(alpha: 0.8),
                  size: 26.sp,
                ),
              ),
            ),
          ],

          Positioned(
            bottom: 12.h,
            right: 12.w,
            child: IconButton(
              onPressed: () {
                ///  TODO: Speak Card
              },
              icon: Icon(
                CupertinoIcons.speaker_2_fill,
                color: AppColors.accentCyan.withValues(alpha: 0.6),
                size: 22.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
