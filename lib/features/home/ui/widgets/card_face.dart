import 'package:code_alpha_flash_card_app/core/models/card_model.dart';
import 'package:code_alpha_flash_card_app/core/theming/app_colors.dart';
import 'package:code_alpha_flash_card_app/core/theming/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardFace extends StatelessWidget {
  const CardFace({
    super.key,
    required this.cardHeight,
    required this.cardModel,
    required this.isInQuiz,
    required this.isFront,
  });

  final double cardHeight;
  final CardModel cardModel;
  final bool isInQuiz;
  final bool isFront;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: cardHeight,
          decoration: BoxDecoration(
            color: AppColors.oceanBlue,
            borderRadius: BorderRadius.circular(24.r),
            border: isFront
                ? null
                : Border.all(
                    color: AppColors.accentCyan.withValues(alpha: 0.5),
                    width: 1.5,
                  ),
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isFront ? cardModel.front : cardModel.back,
                style: AppStyles.font16LavenderGray.copyWith(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              if (cardModel.hint != null &&
                  cardModel.hint!.trim().isNotEmpty &&
                  isFront == true) ...[
                SizedBox(height: 12.h),
                Text(
                  cardModel.hint!,
                  style: AppStyles.font16LavenderGray.copyWith(
                    color: Colors.white70,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ],
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
              /// TODO: Speak Card
            },
            icon: Icon(
              CupertinoIcons.speaker_2_fill,
              color: AppColors.accentCyan.withValues(alpha: 0.6),
              size: 22.sp,
            ),
          ),
        ),
      ],
    );
  }
}
