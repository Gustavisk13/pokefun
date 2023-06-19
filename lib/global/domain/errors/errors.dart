class PokemonNotFoundException implements Exception {
  final String message;

  PokemonNotFoundException({required this.message});
}

class GetAllPokemonsException implements Exception {
  final String message;

  GetAllPokemonsException({required this.message});
}

class GetPokemonsPaginatedException implements Exception {
  final String message;

  GetPokemonsPaginatedException({required this.message});
}

class GetPokemonDetailsException implements Exception {
  final String message;

  GetPokemonDetailsException({required this.message});
}

class GetAllFavoritesException implements Exception {
  final String message;

  GetAllFavoritesException({required this.message});
}

class ToggleFavoriteException implements Exception {
  final String message;

  ToggleFavoriteException({required this.message});
}

class CheckFavoriteException implements Exception {
  final String message;

  CheckFavoriteException({required this.message});
}

class DatasourceException implements Exception {
  final String message;
  final String datasource;

  DatasourceException({required this.message, required this.datasource});
}
