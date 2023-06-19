import 'package:pokefun/global/domain/entity/pokemon.dart';
import 'package:pokefun/global/domain/errors/errors.dart';
import 'package:pokefun/global/domain/repository/pokemon_repository.dart';

abstract class GetAllPokemons {
  Future<List<Pokemon>> call();
}

class GetAllPokemonsImpl implements GetAllPokemons {
  final PokemonRepository _pokemonRepository;

  GetAllPokemonsImpl(this._pokemonRepository);

  @override
  Future<List<Pokemon>> call() async {
    var result = await _pokemonRepository.getPokemons();

    if (result.isEmpty) {
      throw PokemonNotFoundException(message: 'Pokemons not found');
    }

    return result;
  }
}
