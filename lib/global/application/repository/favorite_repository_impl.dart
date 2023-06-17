import 'package:pokefun/global/application/datasource/favorite_datasource.dart';
import 'package:pokefun/global/application/models/pokemon_model.dart';
import 'package:pokefun/global/domain/entity/pokemon.dart';
import 'package:pokefun/global/domain/errors/errors.dart';
import 'package:pokefun/global/domain/repository/favorite_repository.dart';

class FavoriteRepositoryImpl extends FavoriteRepository {
  final FavoriteDatasource favoriteDataSource;

  FavoriteRepositoryImpl({required this.favoriteDataSource});

  @override
  Future<List<Pokemon>> getFavoritePokemons() async {
    List<PokemonModel> pokemons = [];

    try {
      pokemons = await favoriteDataSource.getFavoritePokemons();
      return Future.value(pokemons.map((pokemon) => pokemon.toEntity()).toList());
    } catch (e) {
      throw PokemonFavoriteException(message: '$e');
    }
  }

  @override
  Future<void> addFavorite(Pokemon pokemon) async {
    final pokemonModel = PokemonModel.fromEntity(pokemon);
    pokemonModel.setFavorite = !pokemonModel.isFavorite;
    try {
      await favoriteDataSource.addFavoritePokemon(pokemonModel);
    } catch (e) {
      throw PokemonFavoriteException(message: '$e');
    }
  }

  @override
  Future<void> removeFavorite(Pokemon pokemon) async {
    final pokemonModel = PokemonModel.fromEntity(pokemon);
    pokemonModel.setFavorite = !pokemonModel.isFavorite;
    try {
      favoriteDataSource.removeFavoritePokemon(pokemonModel);
    } catch (e) {
      throw PokemonFavoriteException(message: '$e');
    }
  }
}
