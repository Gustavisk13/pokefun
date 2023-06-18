import 'package:flutter/material.dart';
import 'package:pokefun/global/application/models/pokemon_model.dart';
import 'package:pokefun/global/data/hive/hive_datasource.dart';

class FavoriteController extends ChangeNotifier {
  HiveDatasource _datasource = HiveDatasource();

  Future<void> addFavoritePokemon(PokemonModel pokemon) async {
    try {
      await _datasource.addFavoritePokemon(pokemon);
    } catch (e) {
      throw Exception(e);
    }
  }
}
