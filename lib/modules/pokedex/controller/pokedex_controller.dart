import 'package:flutter/material.dart';
import 'package:pokefun/global/application/models/pokemon_model.dart';
import 'package:pokefun/global/application/repository/pokemon_repository_impl.dart';
import 'package:pokefun/global/data/pokeapi/pokeapi_datasource.dart';
import 'package:pokefun/global/domain/entity/pokemon.dart';
import 'package:pokefun/global/domain/usecase/get_all_pokemons_paginated.dart';
import 'package:pokefun/pokefun_app.dart';

class PokedexController extends ChangeNotifier {
  final GetAllPokemonsPaginatedImpl _getAllPokemons = GetAllPokemonsPaginatedImpl(
    PokemonRepositoryImpl(
      pokemonDatasource: PokeapiDatasource(),
    ),
  );

  final List<PokemonModel> _pokemons = [];
  late final ScrollController _scrollController;
  bool _isLoading = false;
  int _page = 0;

  List<PokemonModel> get pokemons => _pokemons;
  bool get isLoading => _isLoading;
  ScrollController get scrollController => _scrollController;

  PokedexController() {
    fetchData();
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

  Future<void> fetchData() async {
    setIsLoading(true);
    List<Pokemon> pokemons = [];
    List<PokemonModel> pokemonsModels = [];

    try {
      pokemons = await _getAllPokemons(
        limit: _page == 0 ? 21 : 5,
        offset: _page == 0 ? 0 : _page * 5 + (_page == 0 ? 0 : 21),
      );
    } catch (e) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text('$e'),
          backgroundColor: Colors.red,
        ),
      );
    }

    for (Pokemon pokemon in pokemons) {
      pokemonsModels.add(PokemonModel.fromEntity(pokemon));
    }

    setIsLoading(false);

    _pokemons.addAll(pokemonsModels);

    _page++;

    notifyListeners();
  }
}
