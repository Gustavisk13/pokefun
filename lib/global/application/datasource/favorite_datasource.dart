import 'package:pokefun/global/application/models/pokemon_detail_model.dart';
import 'package:pokefun/global/application/models/pokemon_model.dart';

abstract class FavoriteDatasource {
  Future<PokemonModel> getFavoritePokemon(int id);
  Future<List<PokemonModel>> getFavoritePokemons();
  Future<void> addFavoritePokemon(PokemonModel pokemon);
  Future<void> removeFavoritePokemon(PokemonModel pokemon);
}
