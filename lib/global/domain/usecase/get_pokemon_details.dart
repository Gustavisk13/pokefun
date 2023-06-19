import 'dart:developer';

import 'package:pokefun/global/domain/entity/pokemon.dart';
import 'package:pokefun/global/domain/entity/pokemon_detail.dart';
import 'package:pokefun/global/domain/repository/pokemon_repository.dart';

abstract class GetPokemonDetails {
  Future<PokemonDetail> call(int id);
}

class GetPokemonDetailsImpl implements GetPokemonDetails {
  final PokemonRepository _pokemonRepository;

  GetPokemonDetailsImpl(this._pokemonRepository);
  @override
  Future<PokemonDetail> call(int id) async {
    log('GetPokemonDetailsImpl - call');
    final result = await _pokemonRepository.getPokemon(id);

    return result;
  }
}
