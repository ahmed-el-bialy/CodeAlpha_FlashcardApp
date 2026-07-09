import 'package:code_alpha_flash_card_app/core/theming/app_colors.dart';
import 'package:code_alpha_flash_card_app/core/theming/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/logic/get_all_cards_cubit.dart';
import '../../../core/logic/get_all_cards_state.dart';
import '../../../core/widgets/flash_card.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  bool _isHintVisible = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: AppColors.darkBackground,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          "Quiz Mode",
          style: AppStyles.font24BoldIndigoAccentManrope.copyWith(
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.white),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
      body: BlocBuilder<GetAllCardsCubit, GetAllCardsState>(
        builder: (context, state) {
          // 1. حالة التحميل (Loading)
          if (state is CardsLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.indigoAccent),
            );
          }

          // 2. حالة الخطأ (Error)
          if (state is CardsError) {
            return Center(
              child: Text(
                "Error: ${state.errorMessage}",
                style: const TextStyle(color: Colors.redAccent),
              ),
            );
          }

          if (state is CardsLoadedSuccess) {
            final cards = state.cards;

            if (cards.isEmpty) {
              return const Center(
                child: Text(
                  "No cards available for quiz! 💡",
                  style: TextStyle(color: Colors.white70),
                ),
              );
            }

            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                child: Column(
                  children: [

                    Text(
                      "Card ${_currentPage + 1} of ${cards.length}",
                      style: AppStyles.font16LavenderGray.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),

                    const Spacer(),

                    SizedBox(
                      height: 240.h,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: cards.length,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                            _isHintVisible = false;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: FlashCard(
                              cardModel: cards[index],
                              isInQuiz: true,
                              showHint: _isHintVisible,
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 12.h),
                    Text(
                      "💡 Tap card to flip | Swipe to change",
                      style: TextStyle(color: Colors.white38, fontSize: 12.sp),
                    ),

                    const Spacer(),


                    ElevatedButton.icon(
                      onPressed: () {
                        final currentCard = cards[_currentPage];


                        if (currentCard.hint != null && currentCard.hint!
                            .trim()
                            .isNotEmpty) {
                          setState(() {
                            _isHintVisible = true;
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(
                                "💡 No hint available for this card!",
                                style: TextStyle(color: Colors.white),
                              ),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.grey[900],
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        }
                      },
                      icon: const Icon(
                          CupertinoIcons.lightbulb_fill, color: Colors.amber,
                          size: 18),
                      label: const Text("Show Hint"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white10,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 20.w,
                            vertical: 10.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    ),

                    const Spacer(),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _currentPage > 0
                                ? () {
                              _pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                                : null,
                            icon: const Icon(CupertinoIcons.left_chevron),
                            label: const Text("Previous"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.oceanBlue,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.r),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w),


                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _currentPage < cards.length - 1
                                ? () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                                : null,
                            icon: const Icon(CupertinoIcons.right_chevron),
                            label: const Text("Next"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.indigoAccent,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.r),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}