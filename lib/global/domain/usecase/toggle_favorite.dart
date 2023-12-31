import 'package:pokefun/global/domain/entity/pokemon.dart';
import 'package:pokefun/global/domain/repository/favorite_repository.dart';

abstract class ToggleFavorite {
  void call(Pokemon pokemon);
}

class ToggleFavoriteImpl implements ToggleFavorite {
  final FavoriteRepository _favoriteRepository;

  ToggleFavoriteImpl(this._favoriteRepository);

  @override
  void call(Pokemon pokemon) {
    _favoriteRepository.toggleFavorite(pokemon);
  }
}
