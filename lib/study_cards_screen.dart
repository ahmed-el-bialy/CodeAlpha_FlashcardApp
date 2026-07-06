import 'package:code_alpha_flash_card_app/core/theming/app_colors.dart';
import 'package:code_alpha_flash_card_app/features/home/logic/get_all_cards_cubit.dart';
import 'package:code_alpha_flash_card_app/features/home/ui/widgets/flash_card.dart';
import 'package:code_alpha_flash_card_app/features/home/ui/widgets/refresh_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/home/logic/get_all_cards_state.dart';

class StudyCardsScreen extends StatelessWidget {
  const StudyCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.transparent,
        title: Text(
          "Study Cards",
          style: TextStyle(color: AppColors.indigoAccent, fontSize: 19.sp),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.indigoAccent),
        actions: const [
          RefreshButton(),
        ],
      ),

      body: SafeArea(
        child: BlocBuilder<GetAllCardsCubit, GetAllCardsState>(
          builder: (context, state) {
            if (state is CardsLoading) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.indigoAccent),
              );
            }

            if (state is CardsLoadedSuccess) {
              final cardsList = state.cards;

              if (cardsList.isEmpty) {
                return Center(
                  child: Text(
                    "No cards found! Add some cards first.",
                    style: TextStyle(color: Colors.white70, fontSize: 16.sp),
                  ),
                );
              }

              return GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 4.h,
                ),
                itemCount: cardsList.length,
                itemBuilder: (context, index) {
                  final cardModel = cardsList[index];

                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.w, vertical: 8.h),
                    child: FlashCard(
                      cardModel: cardModel,
                      isInQuiz: false,
                    ),
                  );
                },
              );
            }

            if (state is CardsError) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: TextStyle(color: Colors.redAccent, fontSize: 16.sp),
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}