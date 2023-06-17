import 'package:pokefun/global/application/models/pokemon_detail_model.dart';
import 'package:pokefun/global/application/models/pokemon_model.dart';

abstract class SearchDatasource {
  Future<List<PokemonModel>> getPokemons();
  Future<PokemonDetailModel> getPokemon(int id);
}
