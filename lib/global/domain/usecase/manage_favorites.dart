import 'package:pokefun/global/domain/entity/pokemon.dart';
import 'package:pokefun/global/domain/repository/favorite_repository.dart';

mixin ManageFavorites {
  Future<void> call(Pokemon pokemon);
  Future<void> remove(Pokemon pokemon);
}

class ManageFavoritesImpl implements ManageFavorites {
  final FavoriteRepository _favoriteRepository;

  ManageFavoritesImpl(this._favoriteRepository);

  @override
  Future<void> call(Pokemon pokemon) async {
    final result = await _favoriteRepository.addFavorite(pokemon);

    return result;
  }

  @override
  Future<void> remove(Pokemon pokemon) {
    final result = _favoriteRepository.removeFavorite(pokemon);

    return result;
  }
}
