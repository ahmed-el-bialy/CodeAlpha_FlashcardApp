import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/models/card_model.dart';
import 'core/theming/app_colors.dart';
import 'features/home/ui/widgets/flash_card.dart';

class ManageCardsScreen extends StatelessWidget {
  const ManageCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.transparent,
        title: Text(
          "Manage Cards",
          style: TextStyle(color: AppColors.indigoAccent, fontSize: 19.sp),
        ),
        centerTitle: true,
      ),

      body: SafeArea(child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 1.5, mainAxisSpacing: 4.h),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            child: FlashCard(cardModel: CardModel(
                id: "5", front: "what is that??", back: "Nothing")),
          );
        },)),
    );
  }
}
