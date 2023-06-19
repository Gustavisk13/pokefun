import 'package:pokefun/global/domain/entity/pokemon.dart';

class PokemonModel extends Pokemon {
  PokemonModel({
    required int id,
    required String name,
    required String imageUrl,
    bool isFavorite = false,
  }) : super(
          id: id,
          name: name,
          imageUrl: imageUrl,
          isFavorite: isFavorite,
        );

  bool get favorited => super.isFavorite ?? false;

  factory PokemonModel.fromEntity(Pokemon pokemon) {
    return PokemonModel(
      id: pokemon.id,
      name: pokemon.name,
      imageUrl: pokemon.imageUrl,
      isFavorite: pokemon.isFavorite ?? false,
    );
  }

  Pokemon toEntity() {
    return Pokemon(
      id: id,
      name: name,
      imageUrl: imageUrl,
      isFavorite: isFavorite,
    );
  }

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }

  factory PokemonModel.fromMap(Map<dynamic, dynamic> map) {
    return PokemonModel(
      id: map['id'],
      name: map['name'],
      imageUrl: map['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
    };
  }
}
