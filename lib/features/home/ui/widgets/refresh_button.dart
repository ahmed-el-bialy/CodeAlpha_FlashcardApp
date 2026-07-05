import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../logic/get_all_cards_cubit.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await context.read<GetAllCardsCubit>().fetchAllCards();

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text(
                "Library updated successfully! ",
                style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              backgroundColor: AppColors.lavenderGray.withValues(
                  alpha:
                  0.2),

              duration: const Duration(seconds: 2),

              behavior: SnackBarBehavior.floating,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          );
        }
      },
      icon:  Icon(
        Icons.refresh,
        color: AppColors.lavenderGray,
        size: 30.sp,
      ),
    );
  }
}