import 'package:pokefun/global/domain/entity/pokemon.dart';
import 'package:pokefun/global/domain/entity/pokemon_detail.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemons();
  Future<List<Pokemon>> getPokemonsPaginated({required int offset, required int limit});
  Future<PokemonDetail> getPokemon(int id);
}
