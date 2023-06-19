import 'package:pokefun/global/application/models/pokemon_model.dart';

abstract class FavoriteDatasource {
  bool isFavorite(int id);
  void toggleFavorite(PokemonModel pokemon);
  List<PokemonModel> getFavorites();
}
