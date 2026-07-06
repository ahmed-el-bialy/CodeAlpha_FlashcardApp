import 'package:code_alpha_flash_card_app/core/models/card_model.dart';
import 'package:code_alpha_flash_card_app/core/theming/app_colors.dart';
import 'package:code_alpha_flash_card_app/core/theming/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/review/ui/logic/delete_card/delete_card_cubit.dart';
import '../../features/review/ui/logic/edit_card/edit_card_cubit.dart';
import '../../features/review/ui/widgets/edit_card_bottom_sheet.dart';

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
                final editCubit = context.read<EditCardCubit>();

                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: AppColors.darkBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24.r)),
                  ),
                  builder: (_) =>
                      EditCardBottomSheet(
                        cardModel: cardModel,
                        onCardUpdated: (updatedCard) {
                          editCubit.emitUpdateCard(updatedCard);
                        },
                      ),
                );
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
                final deleteCubit = context.read<DeleteCardCubit>();

                showDialog(
                  context: context,
                  builder: (context) =>
                      ConfirmMessage(
                        deleteCubit: deleteCubit,
                        cardModel: cardModel,
                      ),
                );
              },
              icon: Icon(
                CupertinoIcons.trash_circle_fill,
                color: Colors.redAccent.withValues(alpha: 0.8),
                size: 26.sp,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class ConfirmMessage extends StatelessWidget {
  const ConfirmMessage({
    super.key,
    required this.deleteCubit,
    required this.cardModel,
  });

  final DeleteCardCubit deleteCubit;
  final CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.darkBackground,
      elevation: 10,
      insetPadding: EdgeInsets.symmetric(horizontal: 32.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Container(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              CupertinoIcons.exclamationmark_triangle_fill,
              color: Colors.redAccent,
              size: 40.sp,
            ),
            SizedBox(height: 16.h),
            Text(
              "Delete Card",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              "Are you sure you want to delete this card?",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        side: BorderSide(color: Colors.grey.withValues(
                            alpha: 0.5), width: 1),
                      ),
                    ),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      deleteCubit.emitDeleteCard(cardModel.id);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent.withValues(alpha: 0.2),
                      foregroundColor: Colors.redAccent,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        side: const BorderSide(
                            color: Colors.redAccent, width: 1),
                      ),
                    ),
                    child: Text(
                      "Delete",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}