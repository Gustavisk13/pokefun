import 'package:pokefun/global/domain/entity/ability.dart';
import 'package:pokefun/global/domain/entity/move.dart';
import 'package:pokefun/global/enums/pokemon_type.dart';

class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final bool isFavorite;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.isFavorite = false,
  });
}
