import 'dart:ui';

class NavigationModel {
  final String imagePath;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  NavigationModel({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
}
