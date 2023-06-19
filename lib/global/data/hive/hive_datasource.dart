import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokefun/global/application/datasource/favorite_datasource.dart';
import 'package:pokefun/global/application/models/pokemon_detail_model.dart';
import 'package:pokefun/global/application/models/pokemon_model.dart';

class HiveDatasource extends FavoriteDatasource {
  final String _boxName = 'favorite_pokemons';

  Box get box => Hive.box(_boxName);

  ValueListenable<Box<dynamic>> get boxListenable => Hive.box(_boxName).listenable();

  @override
  void toggleFavorite(PokemonModel pokemon) {
    try {
      if (box.containsKey(pokemon.id)) {
        box.delete(pokemon.id);
      } else {
        box.put(pokemon.id, pokemon.toJson());
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  List<PokemonModel> getFavorites() {
    try {
      final List<PokemonModel> result = [];

      box.keys.forEach((key) {
        final pokemon = box.get(key);
        result.add(PokemonModel.fromMap(pokemon));
      });

      return result;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  bool isFavorite(int id) {
    try {
      return box.containsKey(id);
    } catch (e) {
      throw Exception(e);
    }
  }
}
