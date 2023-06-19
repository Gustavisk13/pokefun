import 'package:pokefun/global/application/datasource/favorite_datasource.dart';
import 'package:pokefun/global/application/models/pokemon_model.dart';
import 'package:pokefun/global/domain/entity/pokemon.dart';
import 'package:pokefun/global/domain/errors/errors.dart';
import 'package:pokefun/global/domain/repository/favorite_repository.dart';

class FavoriteRepositoryImpl extends FavoriteRepository {
  final FavoriteDatasource favoriteDataSource;

  FavoriteRepositoryImpl({required this.favoriteDataSource});

  @override
  void toggleFavorite(Pokemon pokemon) {
    try {
      final PokemonModel pokemonModel = PokemonModel.fromEntity(pokemon);
      favoriteDataSource.toggleFavorite(pokemonModel);
    } catch (e) {
      throw ToggleFavoriteException(message: '$e');
    }
  }

  @override
  List<Pokemon> getFavorites() {
    try {
      return favoriteDataSource.getFavorites().map((e) => e.toEntity()).toList();
    } catch (e) {
      throw GetAllFavoritesException(message: '$e');
    }
  }

  @override
  bool isFavorite(int id) {
    try {
      return favoriteDataSource.isFavorite(id);
    } catch (e) {
      throw CheckFavoriteException(message: '$e');
    }
  }
}
