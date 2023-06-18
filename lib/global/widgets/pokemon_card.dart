import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokefun/global/application/models/pokemon_model.dart';
import 'package:pokefun/global/routes/app_routes.dart';
import 'package:pokefun/global/themes/app_themes.dart';
import 'package:pokefun/global/widgets/favorite_button.dart';
import 'package:pokefun/modules/pokemon/controller/pokemon_controller.dart';
import 'package:provider/provider.dart';

class PokemonCard extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final pokemonController = Provider.of<PokemonController>(context);
    return GestureDetector(
      onTap: () => {
        pokemonController.fetchData(pokemon.id),
        GoRouter.of(context).goNamed(
          AppRoutes.pokemon,
        ),
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: pokemon.imageUrl,
              ),
            ),
            Text(
              pokemon.name[0].toUpperCase() + pokemon.name.substring(1),
              style: headlineBold.copyWith(fontSize: 18),
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                '#${pokemon.id.toString().padLeft(3, '0')}',
                textAlign: TextAlign.center,
                style: bodyBold.copyWith(fontSize: 12, color: Colors.grey),
              ),
            ),
            FavoriteButton(
              iconSize: 12,
            )
          ],
        ),
      ),
    );
  }
}
