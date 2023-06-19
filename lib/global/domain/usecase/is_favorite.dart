import 'dart:developer';

import 'package:pokefun/global/domain/repository/favorite_repository.dart';

abstract class IsFavorite {
  bool call(int id);
}

class IsFavoriteImpl implements IsFavorite {
  final FavoriteRepository _favoriteRepository;

  IsFavoriteImpl(this._favoriteRepository);
  @override
  bool call(int id) {
    log('IsFavoriteImpl - call');
    final result = _favoriteRepository.isFavorite(id);

    return result;
  }
}
