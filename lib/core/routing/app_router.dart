import 'package:code_alpha_flash_card_app/features/add_new_card/ui/add_new_card_screen.dart';
import 'package:code_alpha_flash_card_app/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class AppRouter {
  Route generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case AppConstants.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppConstants.newCardScreen:
        return MaterialPageRoute(builder: (_) => const AddCardScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
