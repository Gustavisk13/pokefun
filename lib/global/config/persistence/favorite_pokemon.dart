import 'package:hive/hive.dart';

class FavoritePokemon extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String imageUrl;

  FavoritePokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
}
