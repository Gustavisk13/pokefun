import 'package:pokefun/global/domain/entity/pokemon.dart';

abstract class FavoriteRepository {
  Future<List<Pokemon>> getFavoritePokemons();
  Future<void> addFavorite(Pokemon pokemon);
  Future<void> removeFavorite(Pokemon pokemon);
}
