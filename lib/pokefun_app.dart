import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:pokefun/global/routes/app_router.dart';
import 'package:pokefun/providers.dart';
import 'package:provider/provider.dart';

final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

GlobalKey<ScaffoldMessengerState> get scaffoldMessengerKey => _scaffoldKey;

class PokefunApp extends StatelessWidget {
  const PokefunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.providers,
      builder: (context, child) {
        final GoRouter router = context.watch<AppRouter>().router;
        router.addListener(() {
          Provider.of<AppRouter>(context, listen: false).setPokemonRoute(router.location);
        });

        return MaterialApp.router(
          title: 'Pokéfun',
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: _scaffoldKey,
        );
      },
    );
  }
}
