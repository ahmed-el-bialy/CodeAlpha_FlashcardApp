import 'package:code_alpha_flash_card_app/core/data/repo/cards_repo.dart';
import 'package:code_alpha_flash_card_app/features/add_new_card/logic/add_card_cubit.dart';
import 'package:code_alpha_flash_card_app/features/add_new_card/ui/add_new_card_screen.dart';
import 'package:code_alpha_flash_card_app/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/review/ui/logic/delete_card/delete_card_cubit.dart';
import '../../features/review/ui/logic/edit_card/edit_card_cubit.dart';
import '../../features/home/logic/get_all_cards_cubit.dart';
import '../../features/review/ui/review_cards_screen.dart';
import '../constants/app_constants.dart';

class AppRouter {
  Route generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case AppConstants.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => GetAllCardsCubit(CardsRepo())..fetchAllCards(),
            child: HomeScreen(),
          ),
        );
      case AppConstants.newCardScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AddCardCubit(CardsRepo()),
            child: AddCardScreen(),
          ),
        );

      case AppConstants.studyCards:
        return MaterialPageRoute(
          builder: (_) =>
              MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) =>
                    GetAllCardsCubit(CardsRepo())
                      ..fetchAllCards(),
                  ),
                  BlocProvider(
                    create: (context) => DeleteCardCubit(CardsRepo()),
                  ),
                  BlocProvider(
                    create: (context) => EditCardCubit(CardsRepo()),
                  ),
                ],
            child: const ReviewCardsScreen(),
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}