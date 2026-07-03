import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';

class NavigationItem extends StatelessWidget {
  final int index;
  final int activeIndex;
  final IconData icon;

  final VoidCallback onTap;

  const NavigationItem({
    super.key,
    required this.index,
    required this.activeIndex,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = activeIndex == index;

    return InkWell(
      splashColor: AppColors.accentCyan.withValues(alpha: .35),
      borderRadius: BorderRadius.circular(16.r),
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(8.0.r),
        child: Icon(
          icon,
          size: 28.sp,
          color: isActive ? AppColors.indigoAccent : AppColors.iceBlue,
        ),
      ),
    );
  }
}
