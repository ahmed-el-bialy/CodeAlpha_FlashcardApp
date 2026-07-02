import 'package:code_alpha_flash_card_app/core/contsnts/app_strings.dart';
import 'package:code_alpha_flash_card_app/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case AppStrings.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
