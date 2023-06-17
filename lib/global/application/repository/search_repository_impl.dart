import 'package:pokefun/global/application/datasource/search_datasource.dart';
import 'package:pokefun/global/application/models/pokemon_detail_model.dart';
import 'package:pokefun/global/application/models/pokemon_model.dart';
import 'package:pokefun/global/domain/entity/pokemon.dart';
import 'package:pokefun/global/domain/entity/pokemon_detail.dart';
import 'package:pokefun/global/domain/errors/errors.dart';
import 'package:pokefun/global/domain/repository/search_repository.dart';

class SearchRepositoryImpl extends SearchRepository {
  final SearchDatasource searchDataSource;

  SearchRepositoryImpl({
    required this.searchDataSource,
  });

  @override
  Future<List<Pokemon>> getPokemons() async {
    List<PokemonModel> pokemons = [];

    try {
      pokemons = await searchDataSource.getPokemons();
    } catch (e) {
      throw PokemonSearchException(message: '$e');
    }

    return pokemons.map((pokemon) => pokemon.toEntity()).toList();
  }

  @override
  Future<PokemonDetail> getPokemon(int id) async {
    late PokemonDetailModel pokemonDetail;

    try {
      pokemonDetail = await searchDataSource.getPokemon(id);
    } catch (e) {
      throw PokemonSearchException(message: '$e');
    }

    return pokemonDetail.toEntity();
  }
}
