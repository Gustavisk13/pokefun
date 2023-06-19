import 'package:pokefun/global/domain/entity/pokemon.dart';

abstract class FavoriteRepository {
  bool isFavorite(int id);
  void toggleFavorite(Pokemon pokemon);
  List<Pokemon> getFavorites();
}
