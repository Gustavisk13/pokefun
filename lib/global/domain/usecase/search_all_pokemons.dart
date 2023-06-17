import 'package:pokefun/global/domain/entity/pokemon.dart';
import 'package:pokefun/global/domain/errors/errors.dart';
import 'package:pokefun/global/domain/repository/search_repository.dart';

mixin SeachAllPokemons {
  Future<List<Pokemon>> call();
}

class SearchAllPokemonsImpl implements SeachAllPokemons {
  final SearchRepository _searchRepository;

  SearchAllPokemonsImpl(this._searchRepository);

  @override
  Future<List<Pokemon>> call() async {
    var result = await _searchRepository.getPokemons();

    if (result.isEmpty) {
      throw PokemonNotFoundException(message: 'Pokemons not found');
    }

    return result;
  }
}
