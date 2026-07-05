import 'package:code_alpha_flash_card_app/core/theming/app_colors.dart';
import 'package:code_alpha_flash_card_app/features/home/logic/get_all_cards_cubit.dart';
import 'package:code_alpha_flash_card_app/features/home/logic/get_all_cards_state.dart';
import 'package:code_alpha_flash_card_app/features/home/ui/widgets/flash_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardsListBuilder extends StatelessWidget {
  const CardsListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllCardsCubit, GetAllCardsState>(
      builder: (context, state) {
        if (state is CardsLoading || state is CardsInitial) {
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Center(
                child: CircularProgressIndicator(color: AppColors.indigoAccent),
              ),
            ),
          );
        } else if (state is CardsLoadedSuccess) {
          if (state.cards.isEmpty) {
            return SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40.h),
                child: Center(
                  child: Text(
                    "No cards available yet. Tap '+' to create one!",
                    style: TextStyle(
                      color: AppColors.lavenderGray,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            );
          }
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: FlashCard(
                  cardModel: state.cards[index],
                  isInQuiz: false,
                ),
              );
            }, childCount: state.cards.length),
          );
        } else if (state is CardsError) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                "There was an error: ${state.errorMessage}",
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text(
                "Something went wrong.",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }
      },
    );
  }
}
