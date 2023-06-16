import 'dart:developer';

import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokefun/global/routes/app_routes.dart';
import 'package:pokefun/global/themes/app_themes.dart';
import 'package:pokefun/modules/root/widgets/navbar.dart';
import 'package:pokefun/modules/root/widgets/root_navigation_bar_item.dart';

class RootPage extends StatefulWidget {
  final Widget child;

  const RootPage({super.key, required this.child});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int get currentIndex => _locationToTabIndex(location: GoRouter.of(context).location);

  int _locationToTabIndex({required String location}) {
    final index = tabs.indexWhere((t) => location.startsWith(t.initialRoute));
    return index < 0 ? 0 : index;
  }

  void onItemTapped({required int tabIndex}) {
    if (tabIndex != currentIndex) {
      log("going to ${tabs[tabIndex].initialRoute}");
      context.go(tabs[tabIndex].initialRoute);
    }
  }

  final tabs = [
    RootNavigationTabItem(
      icon: Icons.home,
      title: 'Pokedex',
      initialRoute: AppRoutes.pokedexPath,
    ),
    RootNavigationTabItem(
      icon: Icons.favorite,
      title: 'Favorites',
      initialRoute: AppRoutes.favoritesPath,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            widget.child,
            Navbar(
              width: 240,
              selectedItemColor: accentColor,
              unselectedItemColor: accentColor,
              selectedBackgroundColor: secondaryColor,
              backgroundColor: primaryColor,
              itemBorderRadius: 24,
              margin: const EdgeInsets.all(24),
              iconSize: 32,
              fontSize: 16,
              padding: const EdgeInsets.all(16),
              borderRadius: 24,
              currentIndex: currentIndex,
              onTap: (idnex) => onItemTapped(tabIndex: idnex),
              items: tabs,
            ),
          ],
        ),
      ),
    );
  }
}
