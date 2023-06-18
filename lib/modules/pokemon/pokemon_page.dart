import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokefun/global/routes/app_router.dart';
import 'package:pokefun/global/themes/app_themes.dart';
import 'package:pokefun/global/widgets/label_app_bar.dart';
import 'package:pokefun/modules/pokemon/controller/pokemon_controller.dart';
import 'package:provider/provider.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemonController = Provider.of<PokemonController>(context);

    return Scaffold(
      appBar: LabelAppBar(
        context: context,
        showBackButton: true,
        onBackPressed: () {
          GoRouter.of(context).go(Provider.of<AppRouter>(context, listen: false).previousPokemonRoute);
        },
      ),
      body: pokemonController.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                children: [
                  Text(
                    pokemonController.pokemon.name,
                    style: headlineBoldLarge,
                  ),
                ],
              ),
            ),
    );
  }
}
