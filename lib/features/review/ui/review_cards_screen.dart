import 'package:code_alpha_flash_card_app/core/theming/app_colors.dart';
import 'package:code_alpha_flash_card_app/core/theming/app_styles.dart';
import 'package:code_alpha_flash_card_app/core/widgets/flash_card.dart';
import 'package:code_alpha_flash_card_app/core/widgets/refresh_button.dart';
import 'package:code_alpha_flash_card_app/features/home/logic/get_all_cards_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/logic/get_all_cards_state.dart';
import 'logic/delete_card/delete_card_cubit.dart';
import 'logic/delete_card/delete_card_state.dart';
import 'logic/edit_card/edit_card_cubit.dart';
import 'logic/edit_card/edit_card_state.dart';

class ReviewCardsScreen extends StatelessWidget {
  const ReviewCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.transparent,
        title: Text(
          "Study Cards",
          style: AppStyles.font24BoldIndigoAccentManrope.copyWith(
            fontSize: 19.sp,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.indigoAccent),
        actions: const [RefreshButton()],
      ),
      body: SafeArea(
        child: MultiBlocListener(
          listeners: [
            BlocListener<DeleteCardCubit, DeleteCardState>(
              listener: (context, state) {
                if (state is DeleteCardSuccess) {
                  context.read<GetAllCardsCubit>().fetchAllCards();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Card deleted successfully",
                        style: AppStyles.font17WhiteBold.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 16.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                } else if (state is DeleteCardError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.error,
                        style: AppStyles.font17WhiteBold.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                      backgroundColor: Colors.redAccent,
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 16.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  );
                }
              },
            ),
            BlocListener<EditCardCubit, EditCardState>(
              listener: (context, state) {
                if (state is EditCardSuccess) {
                  context.read<GetAllCardsCubit>().fetchAllCards();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Card updated successfully",
                        style: AppStyles.font17WhiteBold.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 16.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                } else if (state is EditCardError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.error,
                        style: AppStyles.font17WhiteBold.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                      backgroundColor: Colors.redAccent,
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 16.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
          child: BlocBuilder<GetAllCardsCubit, GetAllCardsState>(
            builder: (context, state) {
              if (state is CardsLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.indigoAccent,
                  ),
                );
              }

              if (state is CardsLoadedSuccess) {
                final cardsList = state.cards;

                if (cardsList.isEmpty) {
                  return Center(
                    child: Text(
                      "No cards found! Add some cards first.",
                      style: AppStyles.font16LavenderGray,
                    ),
                  );
                }

                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: cardsList.length,
                  itemBuilder: (context, index) {
                    final cardModel = cardsList[index];

                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 8.h,
                      ),
                      child: FlashCard(cardModel: cardModel, isInQuiz: false),
                    );
                  },
                );
              }

              if (state is CardsError) {
                return Center(
                  child: Text(
                    state.errorMessage,
                    style: AppStyles.font16LavenderGray.copyWith(
                      color: Colors.redAccent,
                    ),
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
