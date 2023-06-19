import 'package:pokefun/global/application/datasource/favorite_datasource.dart';
import 'package:pokefun/global/application/models/pokemon_detail_model.dart';
import 'package:pokefun/global/application/models/pokemon_model.dart';
import 'package:pokefun/global/domain/entity/pokemon.dart';
import 'package:pokefun/global/domain/entity/pokemon_detail.dart';
import 'package:pokefun/global/domain/repository/favorite_repository.dart';

class FavoriteRepositoryImpl extends FavoriteRepository {
  final FavoriteDatasource favoriteDataSource;

  FavoriteRepositoryImpl({required this.favoriteDataSource});

  @override
  void toggleFavorite(Pokemon pokemon) {
    final PokemonModel pokemonModel = PokemonModel.fromEntity(pokemon);
    favoriteDataSource.toggleFavorite(pokemonModel);
  }

  @override
  bool isFavorite(int id) {
    return favoriteDataSource.isFavorite(id);
  }

  @override
  List<Pokemon> getFavorites() {
    return favoriteDataSource.getFavorites().map((e) => e.toEntity()).toList();
  }
}
