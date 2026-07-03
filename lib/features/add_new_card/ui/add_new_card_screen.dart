import 'package:code_alpha_flash_card_app/features/add_new_card/ui/widgets/app_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_styles.dart';
import '../../home/ui/widgets/app_navigation_bar.dart';
import 'widgets/card_form_back_scope.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final _formKey = GlobalKey<FormState>();
  final _questionController = TextEditingController();
  final _hintController = TextEditingController();
  final _answerController = TextEditingController();

  @override
  void dispose() {
    _questionController.dispose();
    _hintController.dispose();
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CardFormBackScope(
      questionController: _questionController,
      hintController: _hintController,
      answerController: _answerController,
      child: Scaffold(
        backgroundColor: AppColors.darkBackground,
        appBar: AppBar(
          backgroundColor: AppColors.darkBackground,
          elevation: 0,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          leadingWidth: 80.w,
          leading: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  if (_questionController.text.isNotEmpty ||
                      _hintController.text.isNotEmpty ||
                      _answerController.text.isNotEmpty) {
                    FocusScope.of(context).unfocus();
                  }
                  Navigator.maybePop(context);
                },
                child: Text(
                  "Cancel",
                  style: AppStyles.font16LavenderGray.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          title: Text(
            "New Card",
            style: AppStyles.font24BoldIndigoAccentManrope.copyWith(
                fontSize: 18.sp),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: InkWell(
                borderRadius: BorderRadius.circular(12.r),
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // TODO: Save data to Cubit
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 14.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: AppColors.indigoAccent.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: AppColors.indigoAccent.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    "Save",
                    style: AppStyles.font24BoldIndigoAccentManrope.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Form(
              key: _formKey,
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpacing(10),
                        Text(
                          "Question (Front)",
                          style: AppStyles.font16LavenderGray,
                        ),
                        verticalSpacing(10),
                        AppTextForm(
                          controller: _questionController,
                          hint: "Enter the question here...",
                          validator: (value) {
                            if (value == null || value
                                .trim()
                                .isEmpty) {
                              return 'Please enter a question';
                            }
                            return null;
                          },
                          maxLines: 3,
                        ),
                        verticalSpacing(20),
                        Text(
                          "Hint (Optional)",
                          style: AppStyles.font16LavenderGray,
                        ),
                        verticalSpacing(10),
                        AppTextForm(
                          controller: _hintController,
                          maxLines: 2,
                          hint: "Enter a helpful hint...",
                        ),
                        verticalSpacing(20),
                        Text(
                          "Answer (Back)",
                          style: AppStyles.font16LavenderGray,
                        ),
                        verticalSpacing(10),
                        AppTextForm(
                          controller: _answerController,
                          maxLines: 4,
                          hint: "Enter the answer or explanation...",
                          validator: (value) {
                            if (value == null || value
                                .trim()
                                .isEmpty) {
                              return 'Please enter an answer';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: AppNavigationBar(activeIndex: 1,),
      ),
    );
  }
}