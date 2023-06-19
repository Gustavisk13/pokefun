import 'package:flutter/material.dart';
import 'package:pokefun/global/application/models/pokemon_model.dart';
import 'package:pokefun/global/themes/app_themes.dart';
import 'package:pokefun/global/widgets/label_app_bar.dart';
import 'package:pokefun/global/widgets/loading_indicator.dart';
import 'package:pokefun/global/widgets/not_found_page.dart';
import 'package:pokefun/global/widgets/pokemon_card.dart';
import 'package:pokefun/modules/pokedex/controller/pokedex_controller.dart';
import 'package:provider/provider.dart';

class PokedexPage extends StatelessWidget {
  const PokedexPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pokedexController = Provider.of<PokedexController>(context);
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
            animation: pokedexController,
            builder: (context, child) {
              if (pokedexController.pokemons.isEmpty) {
                return NotFoundPage(
                  title: 'Pokédex vazia!',
                  actionButton: true,
                  buttonTitle: 'Recarregar',
                  onTap: () {
                    pokedexController.fetchData();
                  },
                );
              }

              return Stack(
                children: [
                  Positioned.fill(
                    child: GridView.builder(
                      key: const PageStorageKey('pokedex'),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.7,
                      ),
                      controller: pokedexController.scrollController,
                      itemCount: pokedexController.pokemons.length,
                      itemBuilder: (context, index) {
                        final PokemonModel pokemon = pokedexController.pokemons[index];

                        return PokemonCard(pokemon: pokemon);
                      },
                    ),
                  ),
                  loadingIndicator(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget loadingIndicator() {
    return Consumer(
      builder: (context, PokedexController pokedexController, child) {
        if (pokedexController.isLoading) {
          return const Positioned(
            bottom: 110,
            left: 0,
            right: 0,
            child: LoadingIndicator(),
          );
        }
        return const Positioned.fill(
          child: SizedBox.shrink(),
        );
      },
    );
  }
}
