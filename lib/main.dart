import 'package:flutter/material.dart';

import 'core/routing/app_router.dart';

void main() {
  runApp(Revio(appRouter: AppRouter(),));
}

class Revio extends StatelessWidget {
  const Revio({super.key, required this.appRouter});

  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
