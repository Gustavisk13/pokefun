import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokefun/global/application/models/pokemon_model.dart';
import 'package:pokefun/global/routes/app_routes.dart';
import 'package:pokefun/global/themes/app_themes.dart';
import 'package:pokefun/modules/favorite/controller/favorite_controller.dart';
import 'package:pokefun/modules/pokemon/controller/pokemon_controller.dart';
import 'package:provider/provider.dart';

class PokemonCard extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final pokemonController = Provider.of<PokemonController>(context);
    final favoriteController = Provider.of<FavoriteController>(context);
    final isFavorite = favoriteController.isFavorite(pokemon.id);
    final MediaQueryData mediaQuery = MediaQuery.of(context);

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
              overflow: TextOverflow.ellipsis,
              style: headlineBold.copyWith(fontSize: mediaQuery.size.width > 385 ? 18 : 16),
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                '#${pokemon.id.toString().padLeft(3, '0')}',
                textAlign: TextAlign.center,
                style: bodyBold.copyWith(fontSize: 12, color: Colors.grey),
              ),
            ),
            GestureDetector(
              onTap: () => {
                favoriteController.toggleFavoritePokemon(pokemon),
              },
              child: Consumer<FavoriteController>(
                builder: (context, value, child) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.all(6),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: isFavorite ? accentColor : primaryColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: accentColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          size: mediaQuery.size.width > 385 ? 16 : 10,
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? primaryColor : accentColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Favorite',
                          overflow: TextOverflow.ellipsis,
                          style: bodyBold.copyWith(
                            color: isFavorite ? primaryColor : accentColor,
                            fontSize: mediaQuery.size.width > 385 ? 12 : 10,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
