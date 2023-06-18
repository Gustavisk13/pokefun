import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokefun/global/application/models/pokemon_detail_model.dart';
import 'package:pokefun/global/themes/app_themes.dart';
import 'package:pokefun/global/widgets/label_app_bar.dart';

class PokemonPage extends StatelessWidget {
  final int pokemonId;
  const PokemonPage({super.key, required this.pokemonId});

  @override
  Widget build(BuildContext context) {
    log('PokemonPage');
    return Scaffold(
        appBar: LabelAppBar(
          context: context,
          showBackButton: true,
        ),
        body: Center(
          child: Text(
            '${pokemonId}',
            style: headlineBoldLarge,
          ),
        ));
  }
}
