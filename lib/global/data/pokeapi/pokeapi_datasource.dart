import 'package:dio/dio.dart';
import 'package:pokefun/global/application/datasource/pokemon_datasource.dart';
import 'package:pokefun/global/application/models/pokemon_detail_model.dart';
import 'package:pokefun/global/application/models/pokemon_model.dart';
import 'package:pokefun/global/config/http/dio_client.dart';
import 'package:pokefun/global/domain/errors/errors.dart';

class PokeapiDatasource extends PokemonDatasource {
  final DioClient dioClient = DioClient(baseUrl: 'https://pokeapi.co/api/v2/');

  @override
  Future<List<PokemonModel>> getPokemonsPaginated({required int offset, required int limit}) async {
    late Response response;
    List<PokemonModel> pokemons = [];

    try {
      response = await dioClient.get('pokemon?limit=$limit&offset=$offset');

      if (response.statusCode != 200) {
        throw DatasourceException(message: 'Erro ao buscar pokemons', datasource: 'Pokeapi');
      }

      final pokemonList = response.data['results'] as List;

      for (final pokemon in pokemonList) {
        final int id = int.tryParse(pokemon['url'].split('/')[6]) ?? 0;
        final String imageUrl = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/$id.png';

        pokemons.add(PokemonModel(
          id: id,
          name: pokemon['name'],
          imageUrl: imageUrl,
        ));
      }

      return Future.value(pokemons);
    } catch (e) {
      throw DatasourceException(message: '$e', datasource: 'Pokeapi');
    }
  }

  @override
  Future<List<PokemonModel>> getPokemons() async {
    late Response response;
    List<PokemonModel> pokemons = [];

    try {
      response = await dioClient.get('pokemon');

      if (response.statusCode != 200) {
        throw DatasourceException(message: 'Erro ao buscar pokemons', datasource: 'Pokeapi');
      }

      final pokemonList = response.data['results'] as List;

      for (final pokemon in pokemonList) {
        final int id = int.tryParse(pokemon['url'].split('/')[6]) ?? 0;
        final String imageUrl = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/$id.png';

        pokemons.add(PokemonModel(
          id: id,
          name: pokemon['name'],
          imageUrl: imageUrl,
        ));
      }

      return Future.value(pokemons);
    } catch (e) {
      throw DatasourceException(message: '$e', datasource: 'Pokeapi');
    }
  }

  @override
  Future<PokemonDetailModel> getPokemon(int id) async {
    late Response response;
    late PokemonDetailModel pokemonDetail;

    try {
      response = await dioClient.get('pokemon/$id');

      if (response.statusCode != 200) {
        throw DatasourceException(message: 'Erro ao buscar detalhes do pokemon', datasource: 'Pokeapi');
      }

      pokemonDetail = PokemonDetailModel.fromJson(response.data);

      return Future.value(pokemonDetail);
    } catch (e) {
      throw DatasourceException(message: '$e', datasource: 'Pokeapi');
    }
  }
}
