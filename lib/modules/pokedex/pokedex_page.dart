import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokefun/global/application/models/pokemon_model.dart';
import 'package:pokefun/global/data/pokeapi/pokeapi_datasource.dart';
import 'package:pokefun/global/themes/app_themes.dart';
import 'package:pokefun/global/widgets/label_app_bar.dart';
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
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          child: AnimatedBuilder(
            animation: pokedexController,
            builder: (context, child) {
              return Stack(
                children: [
                  Positioned.fill(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1,
                      ),
                      controller: pokedexController.scrollController,
                      // physics: const BouncingScrollPhysics(),
                      itemCount: pokedexController.pokemons.length,
                      itemBuilder: (context, index) {
                        final PokemonModel pokemon = pokedexController.pokemons[index];

                        return Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: CachedNetworkImage(
                                imageUrl: pokemon.imageUrl,
                              )),
                              Text(pokemon.name[0].toUpperCase() + pokemon.name.substring(1)),
                            ],
                          ),
                        );
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
            child: CircleAvatar(
              backgroundColor: primaryColor,
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: accentColor,
                ),
              ),
            ),
          );
        }
        return const Positioned.fill(
          child: SizedBox.shrink(),
        );
      },
    );
  }
}
