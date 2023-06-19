import 'dart:developer';

import 'package:pokefun/global/domain/entity/pokemon.dart';
import 'package:pokefun/global/domain/repository/pokemon_repository.dart';

abstract class GetAllPokemonsPaginated {
  Future<List<Pokemon>> call({required int offset, required int limit});
}

class GetAllPokemonsPaginatedImpl implements GetAllPokemonsPaginated {
  final PokemonRepository _pokemonRepository;

  GetAllPokemonsPaginatedImpl(this._pokemonRepository);

  @override
  Future<List<Pokemon>> call({required int offset, required int limit}) async {
    final result = await _pokemonRepository.getPokemonsPaginated(offset: offset, limit: limit);

    return result;
  }
}
