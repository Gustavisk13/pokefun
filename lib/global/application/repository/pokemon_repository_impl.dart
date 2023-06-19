import 'package:pokefun/global/application/datasource/pokemon_datasource.dart';
import 'package:pokefun/global/application/models/pokemon_detail_model.dart';
import 'package:pokefun/global/application/models/pokemon_model.dart';
import 'package:pokefun/global/domain/entity/pokemon.dart';
import 'package:pokefun/global/domain/entity/pokemon_detail.dart';
import 'package:pokefun/global/domain/errors/errors.dart';
import 'package:pokefun/global/domain/repository/pokemon_repository.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  final PokemonDatasource pokemonDatasource;

  PokemonRepositoryImpl({
    required this.pokemonDatasource,
  });

  @override
  Future<List<Pokemon>> getPokemonsPaginated({required int offset, required int limit}) async {
    List<PokemonModel> pokemons = [];

    try {
      pokemons = await pokemonDatasource.getPokemonsPaginated(offset: offset, limit: limit);
    } catch (e) {
      throw PokemonSearchException(message: '$e');
    }

    return pokemons.map((pokemon) => pokemon.toEntity()).toList();
  }

  @override
  Future<List<Pokemon>> getPokemons() async {
    List<PokemonModel> pokemons = [];

    try {
      pokemons = await pokemonDatasource.getPokemons();
    } catch (e) {
      throw PokemonSearchException(message: '$e');
    }

    return pokemons.map((pokemon) => pokemon.toEntity()).toList();
  }

  @override
  Future<PokemonDetail> getPokemon(int id) async {
    late PokemonDetailModel pokemonDetail;

    try {
      pokemonDetail = await pokemonDatasource.getPokemon(id);
    } catch (e) {
      throw PokemonSearchException(message: '$e');
    }

    return pokemonDetail.toEntity();
  }
}
