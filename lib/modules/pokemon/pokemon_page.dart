import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokefun/global/application/models/pokemon_detail_model.dart';
import 'package:pokefun/global/enum/pokemon_action_enum.dart';
import 'package:pokefun/global/enum/pokemon_types_enum.dart';
import 'package:pokefun/global/routes/app_router.dart';
import 'package:pokefun/global/themes/app_themes.dart';
import 'package:pokefun/global/utils/color_by_type.dart';
import 'package:pokefun/global/utils/quick_border.dart';
import 'package:pokefun/global/widgets/label_app_bar.dart';
import 'package:pokefun/global/widgets/loading_indicator.dart';
import 'package:pokefun/modules/favorite/controller/favorite_controller.dart';
import 'package:pokefun/modules/pokemon/controller/pokemon_controller.dart';
import 'package:pokefun/modules/pokemon/widgets/action_card.dart';
import 'package:pokefun/modules/pokemon/widgets/stat_indicator_widget.dart';
import 'package:provider/provider.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemonController = Provider.of<PokemonController>(context);
    final favoriteController = Provider.of<FavoriteController>(context);

    return SafeArea(
      child: Scaffold(
          appBar: LabelAppBar(
            context: context,
            showBackButton: true,
            onBackPressed: () {
              GoRouter.of(context).go(Provider.of<AppRouter>(context, listen: false).previousPokemonRoute);
            },
            valueActions: [
              IconButton(
                onPressed: () {
                  favoriteController.toggleFavoritePokemon(pokemonController.pokemon);
                },
                icon: pokemonController.isLoading
                    ? const Icon(
                        Icons.favorite_border,
                        color: primaryColor,
                      )
                    : Consumer<FavoriteController>(
                        builder: (context, value, child) {
                          return value.isFavorite(pokemonController.pokemon.id)
                              ? const Icon(
                                  Icons.favorite,
                                  color: primaryColor,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                  color: primaryColor,
                                );
                        },
                      ),
              ),
            ],
          ),
          backgroundColor: backgroundColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: pokemonController.isLoading
                ? const Center(
                    child: LoadingIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildPokemonSection(pokemonController),
                        const SizedBox(height: 16),
                        _buildStatsSection(pokemonController.pokemon),
                        const SizedBox(height: 16),
                        _buildAbilitiesSection(pokemonController.pokemon),
                        const SizedBox(height: 16),
                        _buildMovesSection(pokemonController.pokemon),
                      ],
                    ),
                  ),
          )),
    );
  }

  Widget _buildPokemonSection(PokemonController pokemonController) {
    final PokemonDetailModel pokemon = pokemonController.pokemon;
    return Column(
      children: [
        _buildPokemonImage(pokemonController),
        const SizedBox(height: 16),
        _buildPokemonType(pokemon),
        const SizedBox(height: 16),
        Text(
          '${pokemon.name[0].toUpperCase()}${pokemon.name.substring(1)}',
          style: headlineBoldLarge.copyWith(
            fontSize: 32,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          '#${pokemon.id.toString().padLeft(3, '0')}',
          style: bodyBold.copyWith(
            fontSize: 20,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildPokemonImage(PokemonController pokemonController) {
    final PokemonDetailModel pokemon = pokemonController.pokemon;
    return Row(
      children: [
        IconButton(
            iconSize: 36,
            onPressed: () => pokemonController.isFirstPokemon ? null : pokemonController.fetchData(pokemon.id - 1),
            icon: const Icon(
              color: accentColor,
              Icons.arrow_back_ios,
            )),
        Expanded(
          child: GestureDetector(
            onPanUpdate: (details) {
              const int sensitivity = 4;
              if (details.delta.dx > sensitivity && !pokemonController.isLoading) {
                pokemonController.isFirstPokemon ? null : pokemonController.fetchData(pokemon.id - 1);
              } else if (details.delta.dx < -sensitivity && !pokemonController.isLoading) {
                pokemonController.fetchData(pokemon.id + 1);
              }
            },
            child: CachedNetworkImage(
              imageUrl: pokemon.imageUrl,
              width: 200,
              height: 200,
            ),
          ),
        ),
        IconButton(
            iconSize: 36,
            onPressed: () => pokemonController.fetchData(pokemon.id + 1),
            icon: const Icon(
              color: accentColor,
              Icons.arrow_forward_ios,
            )),
      ],
    );
  }

  Widget _buildPokemonType(PokemonDetailModel pokemon) {
    List<Widget> typeWidgets = pokemon.types.map((type) {
      return Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: ColorByType.getColor(type: PokemonTypes.values.firstWhere((element) => element.name == type.type)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          '${type.type[0].toUpperCase()}${type.type.substring(1)}',
          style: bodyBold.copyWith(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      );
    }).toList();

    if (typeWidgets.length > 1) {
      typeWidgets = typeWidgets.expand((widget) {
        return [widget, const SizedBox(width: 10)];
      }).toList();
      typeWidgets.removeLast();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: typeWidgets,
    );
  }

  Widget _buildStatsSection(PokemonDetailModel pokemon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              StatIndicatorWidget(stat: 'hp', value: pokemon.hp),
              StatIndicatorWidget(stat: 'speed', value: pokemon.speed),
              StatIndicatorWidget(stat: 'height', value: pokemon.height / 10),
              StatIndicatorWidget(stat: 'weight', value: pokemon.weight / 10),
            ],
          ),
        ),
        SizedBox(height: 8),
        Flexible(
          fit: FlexFit.loose,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              StatIndicatorWidget(stat: 'attack', value: pokemon.attack),
              StatIndicatorWidget(stat: 'defense', value: pokemon.defense),
              StatIndicatorWidget(stat: 'special-defense', value: pokemon.specialDefense),
              StatIndicatorWidget(stat: 'special-attack', value: pokemon.specialAttack),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAbilitiesSection(PokemonDetailModel pokemon) {
    List<Widget> abilityWidgets = pokemon.abilities.map((ability) {
      return ActionCard(
        title: ability.ability,
        action: PokemonAction.ability,
      );
    }).toList();

    if (abilityWidgets.length > 1) {
      abilityWidgets = abilityWidgets.expand((widget) {
        return [widget, const SizedBox(height: 10)];
      }).toList();
      abilityWidgets.removeLast();
    }

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Abilities',
            style: headlineBoldLarge.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Column(children: abilityWidgets),
        ],
      ),
    );
  }

  Widget _buildMovesSection(PokemonDetailModel pokemon) {
    List<Widget> moveWidgets = pokemon.moves.map((move) {
      return ActionCard(
        title: move.name,
        action: PokemonAction.move,
      );
    }).toList();

    if (moveWidgets.length > 1) {
      moveWidgets = moveWidgets.expand((widget) {
        return [widget, const SizedBox(height: 10)];
      }).toList();
      moveWidgets.removeLast();
    }

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Moves',
            style: headlineBoldLarge.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Column(children: moveWidgets),
        ],
      ),
    );
  }
}
