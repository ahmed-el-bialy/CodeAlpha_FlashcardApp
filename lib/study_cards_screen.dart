import 'package:code_alpha_flash_card_app/core/models/card_model.dart';
import 'package:code_alpha_flash_card_app/core/theming/app_colors.dart';
import 'package:code_alpha_flash_card_app/features/home/ui/widgets/flash_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          iconTheme: IconThemeData(
              color: AppColors.indigoAccent
          ),
        ),

        body: SafeArea(child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.5,
                mainAxisSpacing: 4.h),
            itemBuilder: ((context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                child: FlashCard(cardModel: CardModel(
                    id: "5", front: "what is that??", back: "Nothing"), isInQuiz: false,),
              );
            })))
    );
  }
}
