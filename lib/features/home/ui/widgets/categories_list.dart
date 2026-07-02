import 'package:code_alpha_flash_card_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  final categories = ["All", "Programming", "Medical", "Languages", "+"];
  int itemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 30.h,
        child: ListView.builder(
          itemCount: categories.length,

          scrollDirection: Axis.horizontal,

          padding: EdgeInsets.symmetric(horizontal: 4.w),
          itemBuilder: (context, index) {

            bool isSelected = index == itemIndex;

            return Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    itemIndex = index;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.indigoAccent
                        : AppColors.darkBackground,
                    borderRadius: BorderRadius.circular(20.r),

                    border: isSelected
                        ? null
                        : Border.all(
                            color: AppColors.lavenderGray.withValues(
                              alpha: 0.3,
                            ),
                            width: 1.2,
                          ),
                  ),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: "Manrope",
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: isSelected ? Colors.white : AppColors.lavenderGray,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
