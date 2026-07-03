import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/helpers/routing_extension.dart';
import '../../../../core/theming/app_colors.dart';
import 'navigation_item.dart';

class AppNavigationBar extends StatelessWidget {
  final int activeIndex;

  const AppNavigationBar({super.key, required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h, left: 24.w, right: 24.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
            child: Container(
              height: 64.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.r),
                color: AppColors.darkBackground.withValues(alpha: 0.5),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.07),
                  width: 1,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(25.r),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    NavigationItem(
                      index: 0,
                      activeIndex: activeIndex,
                      icon: Icons.home_rounded,
                      splashAlpha: .3,
                      onTap: () {
                        if (activeIndex != 0) {
                          context.pushReplacementNamed(AppConstants.homeScreen, null);
                        }
                      },
                    ),
                    NavigationItem(
                      index: 1,
                      activeIndex: activeIndex,
                      icon: Icons.add_circle,
                      splashAlpha: .4,
                      onTap: () {
                        context.pushNamed(AppConstants.newCardScreen, null);
                      },
                    ),
                    NavigationItem(
                      index: 2,
                      activeIndex: activeIndex,
                      icon: Icons.quiz_rounded,
                      splashAlpha: .3,
                      onTap: () {
                        if (activeIndex != 2) {
                          // context.pushReplacementNamed(AppConstants.quizScreen, null);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}