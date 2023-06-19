import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokefun/global/routes/app_routes.dart';
import 'package:pokefun/global/routes/transitions/slide_in_route.dart';
import 'package:pokefun/modules/favorite/favorite_page.dart';
import 'package:pokefun/modules/pokedex/pokedex_page.dart';
import 'package:pokefun/modules/pokemon/pokemon_page.dart';
import 'package:pokefun/modules/root/root_page.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  GoRouter get router => _router;

  String previousPokemonRoute = '';

  setPokemonRoute(String route) {
    if (route != AppRoutes.pokemonPath) {
      previousPokemonRoute = route;
    }
  }

  late final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.pokedexPath,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: AppRoutes.pokemon,
        path: AppRoutes.pokemonPath,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: PokemonPage());
        },
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state, child) {
          return NoTransitionPage(child: RootPage(child: child));
        },
        routes: [
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            name: AppRoutes.pokedex,
            path: AppRoutes.pokedexPath,
            pageBuilder: (context, state) => SlideInRoute(child: PokedexPage()),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            name: AppRoutes.favorites,
            path: AppRoutes.favoritesPath,
            pageBuilder: (context, state) => SlideInRoute(child: FavoritePage()),
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
