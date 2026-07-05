import 'package:code_alpha_flash_card_app/core/helpers/spacing.dart';
import 'package:code_alpha_flash_card_app/core/theming/app_colors.dart';
import 'package:code_alpha_flash_card_app/core/theming/app_styles.dart';
import 'package:code_alpha_flash_card_app/features/home/logic/get_all_cards_cubit.dart';
import 'package:code_alpha_flash_card_app/features/home/logic/get_all_cards_state.dart';
import 'package:code_alpha_flash_card_app/features/home/ui/widgets/app_navigation_bar.dart';
import 'package:code_alpha_flash_card_app/features/home/ui/widgets/flash_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.darkBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              title: Text(
                "Revio",
                style: AppStyles.font24BoldIndigoAccentManrope,
              ),
              backgroundColor: AppColors.darkBackground,
              floating: true,
            ),

            SliverToBoxAdapter(
              child: Text(
                "Card Library",
                style: AppStyles.font24BoldIceBlueManrope,
              ),
            ),

            sliverVerticalSpacing(4),

            SliverToBoxAdapter(
              child: Text(
                "Manage and organize your study sets efficiently. Choose a set to start or create a new one.",
                style: AppStyles.font16LavenderGray,
              ),
            ),

            sliverVerticalSpacing(15),

            BlocBuilder<GetAllCardsCubit, GetAllCardsState>(
              builder: (context, state) {
                if (state is CardsLoading || state is CardsInitial) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                else if (state is CardsLoadedSuccess) {
                  if (state.cards.isEmpty) {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          "No cards available yet.",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }


                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 8.h,
                            horizontal: 8.w,
                          ),
                          child: FlashCard(cardModel: state.cards[index]),
                        );
                      },
                      childCount: state.cards
                          .length,
                    ),
                  );
                }

                else if (state is CardsError) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        "There was an error: ${state.errorMessage}",
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  );
                }

                else {
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
            ),

            sliverVerticalSpacing(20),
          ],
        ),
      ),
      bottomNavigationBar: AppNavigationBar(activeIndex: 0),
    );
  }
}