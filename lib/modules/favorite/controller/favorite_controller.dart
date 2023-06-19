import 'package:flutter/material.dart';
import 'package:pokefun/global/application/repository/favorite_repository_impl.dart';
import 'package:pokefun/global/data/hive/hive_datasource.dart';
import 'package:pokefun/global/domain/entity/pokemon.dart';
import 'package:pokefun/global/domain/entity/pokemon_detail.dart';
import 'package:pokefun/global/domain/usecase/get_all_favorites.dart';
import 'package:pokefun/global/domain/usecase/is_favorite.dart';
import 'package:pokefun/global/domain/usecase/toggle_favorite.dart';

class FavoriteController extends ChangeNotifier {
  final ToggleFavoriteImpl toggleFavorite = ToggleFavoriteImpl(
    FavoriteRepositoryImpl(
      favoriteDataSource: HiveDatasource(),
    ),
  );

  final IsFavoriteImpl isFavoriteImpl = IsFavoriteImpl(
    FavoriteRepositoryImpl(
      favoriteDataSource: HiveDatasource(),
    ),
  );

  final GetAllFavoritesImpl getAllFavorites = GetAllFavoritesImpl(
    FavoriteRepositoryImpl(
      favoriteDataSource: HiveDatasource(),
    ),
  );

  final List<Pokemon> _favorites = [];
  final ScrollController scrollController = ScrollController();

  List<Pokemon> get favorites => _favorites;

  void fetchData() {
    List<Pokemon> result = getAllFavorites();

    _favorites.clear();
    _favorites.addAll(result);

    notifyListeners();
  }

  void toggleFavoritePokemon(Pokemon pokemon) {
    toggleFavorite(pokemon);

    notifyListeners();
  }

  bool isFavorite(int id) {
    return isFavoriteImpl(id);
  }
}
