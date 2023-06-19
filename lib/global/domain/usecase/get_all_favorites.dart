import 'package:pokefun/global/domain/entity/pokemon.dart';
import 'package:pokefun/global/domain/repository/favorite_repository.dart';

abstract class GetAllFavorites {
  List<Pokemon> call();
}

class GetAllFavoritesImpl implements GetAllFavorites {
  final FavoriteRepository _favoriteRepository;

  GetAllFavoritesImpl(this._favoriteRepository);
  @override
  List<Pokemon> call() {
    final result = _favoriteRepository.getFavorites();

    return result;
  }
}
