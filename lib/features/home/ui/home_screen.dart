import 'package:code_alpha_flash_card_app/core/helpers/spacing.dart';
import 'package:code_alpha_flash_card_app/core/theming/app_colors.dart';
import 'package:code_alpha_flash_card_app/core/theming/app_styles.dart';
import 'package:code_alpha_flash_card_app/features/home/ui/widgets/app_navigation_bar.dart';
import 'package:code_alpha_flash_card_app/features/home/ui/widgets/categories_list.dart';
import 'package:code_alpha_flash_card_app/features/home/ui/widgets/flash_card.dart';
import 'package:flutter/material.dart';
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
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_rounded, size: 24),
                  color: AppColors.accentCyan,
                  splashColor: AppColors.oceanBlue,
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.oceanBlue.withValues(
                      alpha: 0.9,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  tooltip: 'Add New Card',
                ),
              ],
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

            sliverVerticalSpacing(16),

            const CategoriesList(),

            sliverVerticalSpacing(20),

            SliverToBoxAdapter(
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 8.w,
                    ),
                    child: FlashCard(cardModel: null),
                  );
                },
              ),
            ),

            sliverVerticalSpacing(20),
          ],
        ),
      ),

      bottomNavigationBar: AppNavigationBar(activeIndex: 0,),
    );
  }
}
