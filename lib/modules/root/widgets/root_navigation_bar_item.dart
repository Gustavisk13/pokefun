import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class RootNavigationTabItem extends FloatingNavbarItem {
  final String initialRoute;

  RootNavigationTabItem({
    required String title,
    required IconData icon,
    required this.initialRoute,
  }) : super(icon: icon, title: title);
}
