import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokefun/global/application/models/pokemon_model.dart';
import 'package:pokefun/global/themes/app_themes.dart';
import 'package:pokefun/global/widgets/label_app_bar.dart';
import 'package:pokefun/global/widgets/loading_indicator.dart';
import 'package:pokefun/global/widgets/pokemon_card.dart';
import 'package:pokefun/modules/favorite/controller/favorite_controller.dart';
import 'package:pokefun/modules/pokedex/controller/pokedex_controller.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteController = Provider.of<FavoriteController>(context);
    favoriteController.fetchData();
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: LabelAppBar(
        context: context,
        valueActions: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: AnimatedTextField(
          //     onTap: () {
          //       log('onTap');
          //     },
          //     controller: TextEditingController(),
          //   ),
          // ),

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
              return Stack(
                children: [
                  Positioned.fill(
                    child: GridView.builder(
                      key: const PageStorageKey('favorites'),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.7,
                      ),
                      controller: favoriteController.scrollController,
                      // physics: const BouncingScrollPhysics(),
                      itemCount: favoriteController.favorites.length,
                      itemBuilder: (context, index) {
                        final PokemonModel pokemon = PokemonModel.fromEntity(favoriteController.favorites[index]);

                        return PokemonCard(pokemon: pokemon);
                      },
                    ),
                  ),
                  // loadingIndicator(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  // Widget loadingIndicator() {
  //   return Consumer(
  //     builder: (context, favoriteController favoriteController, child) {
  //       if (favoriteController.isLoading) {
  //         return const Positioned(
  //           bottom: 110,
  //           left: 0,
  //           right: 0,
  //           child: LoadingIndicator(),
  //         );
  //       }
  //       return const Positioned.fill(
  //         child: SizedBox.shrink(),
  //       );
  //     },
  //   );
  // }
}
