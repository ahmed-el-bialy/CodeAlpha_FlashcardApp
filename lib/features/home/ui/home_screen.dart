import 'package:code_alpha_flash_card_app/core/constants/app_constants.dart';
import 'package:code_alpha_flash_card_app/core/helpers/routing_extension.dart';
import 'package:code_alpha_flash_card_app/core/helpers/spacing.dart';
import 'package:code_alpha_flash_card_app/core/theming/app_colors.dart';
import 'package:code_alpha_flash_card_app/core/theming/app_styles.dart';
import 'package:code_alpha_flash_card_app/features/home/logic/get_all_cards_cubit.dart';
import 'package:code_alpha_flash_card_app/features/home/logic/get_all_cards_state.dart';
import 'package:code_alpha_flash_card_app/features/home/ui/widgets/cards_number_container.dart';
import 'package:code_alpha_flash_card_app/features/home/ui/widgets/home_option_tile.dart';
import 'package:code_alpha_flash_card_app/features/home/ui/widgets/refresh_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../navigation_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final List<NavigationModel> models = [
    NavigationModel(
      imagePath: "assets/images/book.png",
      title: "Study Cards",
      subtitle: "Review your flashcards",
      onTap: () {},
    ),
    NavigationModel(
      imagePath: "assets/images/manage.png",
      title: "Manage Cards",
      subtitle: "Edit or delete your cards",
      onTap: () {},
    ),
    NavigationModel(
      imagePath: "assets/images/add.png",
      title: "Add New Card",
      subtitle: "Create a new flashcard",
      onTap: () {
        context.pushNamed(AppConstants.newCardScreen, null);
      },
    ),
  ];
  @override
  void initState() {
    super.initState();
    context.read<GetAllCardsCubit>().fetchAllCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.darkBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
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
              actions: const [
                RefreshButton(),
              ],
            ),
            SliverToBoxAdapter(
              child: Text(
                "Card Library",
                style: AppStyles.font24BoldIceBlueManrope,
              ),
            ),
            sliverVerticalSpacing(6),
            SliverToBoxAdapter(
              child: Text(
                "Manage and organize your study sets efficiently. Choose a set to start or create a new one.",
                style: AppStyles.font16LavenderGray,
              ),
            ),
            sliverVerticalSpacing(20),


            BlocBuilder<GetAllCardsCubit, GetAllCardsState>(
              buildWhen: (previous, current) => current is CardsLoadedSuccess,
              builder: (context, state) {
                final totalCards = (state is CardsLoadedSuccess) ? state.cards
                    .length : 0;

                return CardsNumberContainer(totalCards: totalCards);
              },
            ),

            sliverVerticalSpacing(20),
            SliverToBoxAdapter(
              child: Text(
                "What would you like to do?",
                style: AppStyles.font24BoldIceBlueManrope.copyWith(
                  fontSize: 17.sp,
                ),
              ),),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: models.length, (context,
                  index,) {
                return HomeOptionTile(model: models[index]);
              }),
            ),

            sliverVerticalSpacing(80),
          ],
        ),
      ),
    );
  }
}
