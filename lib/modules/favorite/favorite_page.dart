import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokefun/global/application/models/pokemon_model.dart';
import 'package:pokefun/global/routes/app_routes.dart';
import 'package:pokefun/global/themes/app_themes.dart';
import 'package:pokefun/global/widgets/label_app_bar.dart';
import 'package:pokefun/global/widgets/not_found_page.dart';
import 'package:pokefun/global/widgets/pokemon_card.dart';
import 'package:pokefun/modules/favorite/controller/favorite_controller.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteController = Provider.of<FavoriteController>(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: LabelAppBar(
        context: context,
        valueActions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  child: Text('App version 1.0.0'),
                ),
              ];
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          child: AnimatedBuilder(
            animation: favoriteController,
            builder: (context, child) {
              if (favoriteController.favorites.isEmpty) {
                return Center(
                  child: NotFoundPage(
                    title: 'No favorite pokémon found',
                    actionButton: true,
                    buttonTitle: 'Explore Pokémons!',
                    onTap: () {
                      GoRouter.of(context).go(AppRoutes.pokedexPath);
                    },
                  ),
                );
              }

              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      key: const PageStorageKey('favorites'),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.7,
                      ),
                      controller: favoriteController.scrollController,
                      itemCount: favoriteController.favorites.length,
                      itemBuilder: (context, index) {
                        final PokemonModel pokemon = PokemonModel.fromEntity(favoriteController.favorites[index]);

                        return PokemonCard(pokemon: pokemon);
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
