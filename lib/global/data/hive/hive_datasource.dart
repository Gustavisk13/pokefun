import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokefun/global/application/datasource/favorite_datasource.dart';
import 'package:pokefun/global/application/models/pokemon_model.dart';

class HiveDatasource extends FavoriteDatasource {
  final String _boxName = 'favorite_pokemons';

  Box get box => Hive.box(_boxName);

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
      return box.values.map((e) => PokemonModel.fromMap(e)).toList();
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
