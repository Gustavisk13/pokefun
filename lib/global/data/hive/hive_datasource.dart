import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:pokefun/global/application/datasource/favorite_datasource.dart';
import 'package:pokefun/global/application/models/pokemon_model.dart';
import 'package:pokefun/global/application/models/pokemon_detail_model.dart';

class HiveDatasource extends FavoriteDatasource {
  final String _boxName = 'favorite_pokemons';

  Box<PokemonModel> get box => Hive.box<PokemonModel>(_boxName);

  HiveDatasource() {
    _init();
  }

  Future<void> _init() async {
    await Hive.openBox<PokemonModel>(_boxName);
  }

  @override
  Future<void> addFavoritePokemon(PokemonModel pokemon) async {
    try {
      await box.put(pokemon.id, pokemon);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<PokemonModel> getFavoritePokemon(int id) {
    try {
      var pokemon = box.get(id);
      return Future.value(pokemon);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<PokemonModel>> getFavoritePokemons() {
    List<PokemonModel> pokemons = [];

    try {
      pokemons = box.values.toList();
      return Future.value(pokemons);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> removeFavoritePokemon(PokemonModel pokemon) async {
    try {
      //TODO: check if box is open
      await box.delete(pokemon.id);
    } catch (e) {
      throw Exception(e);
    }
  }
}
