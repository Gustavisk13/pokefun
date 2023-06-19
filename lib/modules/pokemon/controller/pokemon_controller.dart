import 'package:flutter/material.dart';
import 'package:pokefun/global/application/models/pokemon_detail_model.dart';
import 'package:pokefun/global/application/repository/pokemon_repository_impl.dart';
import 'package:pokefun/global/data/pokeapi/pokeapi_datasource.dart';
import 'package:pokefun/global/domain/usecase/get_pokemon_details.dart';

class PokemonController extends ChangeNotifier {
  final ScrollController _scrollController = ScrollController();
  late PokemonDetailModel _pokemon;

  final GetPokemonDetailsImpl _getPokemonDetails = GetPokemonDetailsImpl(PokemonRepositoryImpl(
    pokemonDatasource: PokeapiDatasource(),
  ));

  bool _isLoading = false;

  ScrollController get scrollController => _scrollController;
  bool get isLoading => _isLoading;
  PokemonDetailModel get pokemon => _pokemon;
  bool get isFirstPokemon => _pokemon.id == 1;

  setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> fetchData(int id) async {
    setIsLoading(true);
    _pokemon = PokemonDetailModel.fromEntity(await _getPokemonDetails(id));
    setIsLoading(false);

    notifyListeners();
  }
}
