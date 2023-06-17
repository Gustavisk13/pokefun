import 'package:pokefun/global/domain/entity/pokemon.dart';
import 'package:pokefun/global/domain/entity/pokemon_detail.dart';

abstract class SearchRepository {
  Future<List<Pokemon>> getPokemons();
  Future<PokemonDetail> getPokemon(int id);
}
