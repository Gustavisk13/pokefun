import 'package:pokefun/global/application/models/pokemon_detail_model.dart';
import 'package:pokefun/global/application/models/pokemon_model.dart';

abstract class PokemonDatasource {
  Future<List<PokemonModel>> getPokemons();
  Future<List<PokemonModel>> getPokemonsPaginated({required int offset, required int limit});
  Future<PokemonDetailModel> getPokemon(int id);
}
