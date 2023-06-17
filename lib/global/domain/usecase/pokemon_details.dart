import 'package:pokefun/global/domain/entity/pokemon.dart';
import 'package:pokefun/global/domain/repository/search_repository.dart';

mixin PokemonDetails {
  Future<Pokemon> call(int id);
}

class PokemonDetailsImpl implements PokemonDetails {
  final SearchRepository _searchRepository;

  PokemonDetailsImpl(this._searchRepository);
  @override
  Future<Pokemon> call(int id) {
    final result = _searchRepository.getPokemon(id);

    return result;
  }
}
