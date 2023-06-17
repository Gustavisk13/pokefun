import 'package:hive/hive.dart';
import 'package:pokefun/global/application/datasource/favorite_datasource.dart';
import 'package:pokefun/global/application/models/pokemon_model.dart';
import 'package:pokefun/global/application/models/pokemon_detail_model.dart';

class HiveDatasource extends FavoriteDatasource {
  final String _boxName = 'favorite_pokemons';

  @override
  Future<void> addFavoritePokemon(PokemonModel pokemon) async {
    try {
      var box = await Hive.openBox<PokemonModel>(_boxName);
      await box.put(pokemon.id, pokemon);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<PokemonModel> getFavoritePokemon(int id) {
    try {
      var box = Hive.box<PokemonModel>(_boxName);
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
      var box = Hive.box<PokemonModel>(_boxName);
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
      var box = Hive.box<PokemonModel>(_boxName);
      await box.delete(pokemon.id);
    } catch (e) {
      throw Exception(e);
    }
  }
}
