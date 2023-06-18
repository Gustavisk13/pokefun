import 'package:flutter/material.dart';
import 'package:pokefun/global/application/models/pokemon_model.dart';
import 'package:pokefun/global/data/pokeapi/pokeapi_datasource.dart';

class PokedexController extends ChangeNotifier {
  final PokeapiDatasource _datasource = PokeapiDatasource();
  final List<PokemonModel> _pokemons = [];
  late final ScrollController _scrollController;
  bool _isLoading = false;
  int _page = 0;

  List<PokemonModel> get pokemons => _pokemons;
  bool get isLoading => _isLoading;
  ScrollController get scrollController => _scrollController;

  PokedexController() {
    fetchData(isFirst: true);
    _scrollController = ScrollController();
    _scrollController.addListener((infiniteScrolling));
  }

  @override
  dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void infiniteScrolling() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !_isLoading) {
      fetchData();
    }
  }

  Future<List<PokemonModel>> fetchPokemons() async {
    return await _datasource.getPokemons();
  }

  Future<void> fetchData({bool? isFirst}) async {
    setIsLoading(true);
    final results = await _datasource.getPokemons(page: _page, isFirst: isFirst);
    setIsLoading(false);

    _pokemons.addAll(results);

    _page++;

    notifyListeners();
  }
}
