import 'package:flutter/material.dart';
import 'package:pokefun/global/application/models/pokemon_detail_model.dart';
import 'package:pokefun/global/data/pokeapi/pokeapi_datasource.dart';

class PokemonController extends ChangeNotifier {
  final ScrollController _scrollController = ScrollController();
  final PokeapiDatasource _datasource = PokeapiDatasource();
  late PokemonDetailModel _pokemon;
  bool _isLoading = false;

  ScrollController get scrollController => _scrollController;
  bool get isLoading => _isLoading;
  PokemonDetailModel get pokemon => _pokemon;

  setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> fetchData(int id) async {
    setIsLoading(true);
    _pokemon = await _datasource.getPokemon(id);
    setIsLoading(false);
    notifyListeners();
  }
}
