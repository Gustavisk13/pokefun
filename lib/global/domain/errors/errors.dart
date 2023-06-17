class PokemonNotFoundException implements Exception {
  final String message;

  PokemonNotFoundException({required this.message});
}

class ServerException implements Exception {
  final String message;

  ServerException({required this.message});
}

class CacheException implements Exception {
  final String message;

  CacheException({required this.message});
}

class PokemonSearchException implements Exception {
  final String message;

  PokemonSearchException({required this.message});
}

class PokemonDetailException implements Exception {
  final String message;

  PokemonDetailException({required this.message});
}

class PokemonFavoriteException implements Exception {
  final String message;

  PokemonFavoriteException({required this.message});
}
