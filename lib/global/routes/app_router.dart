import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokefun/global/routes/app_routes.dart';
import 'package:pokefun/global/routes/transitions/slide_in_route.dart';
import 'package:pokefun/modules/favorite/favorite_page.dart';
import 'package:pokefun/modules/pokedex/pokedex_page.dart';
import 'package:pokefun/modules/root/root_page.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  GoRouter get router => _router;

  late final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.pokedexPath,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        name: AppRoutes.pokemon,
        path: AppRoutes.pokemonPath,
        pageBuilder: (context, state) => NoTransitionPage(child: Container()),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state, child) {
          return SlideInRoute(child: RootPage(child: child));
        },
        routes: [
          GoRoute(
            name: AppRoutes.pokedex,
            path: AppRoutes.pokedexPath,
            pageBuilder: (context, state) => const NoTransitionPage(child: PokedexPage()),
          ),
          GoRoute(
            name: AppRoutes.favorites,
            path: AppRoutes.favoritesPath,
            pageBuilder: (context, state) => const NoTransitionPage(child: FavoritePage()),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) {
      return const Scaffold(
        body: Center(
          child: Text('Page not found'),
        ),
      );
    },
  );
}
