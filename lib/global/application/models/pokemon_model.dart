import 'package:pokefun/global/application/models/pokemon_move_model.dart';
import 'package:pokefun/global/domain/entity/pokemon.dart';
import 'package:pokefun/global/enums/pokemon_type.dart';

class PokemonModel {
  final int id;
  final String name;
  final String imageUrl;
  bool isFavorite;

  PokemonModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.isFavorite = false,
  });

  factory PokemonModel.fromEntity(Pokemon pokemon) {
    return PokemonModel(
      id: pokemon.id,
      name: pokemon.name,
      imageUrl: pokemon.imageUrl,
      isFavorite: pokemon.isFavorite,
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  set setFavorite(bool value) {
    isFavorite = value;
  }
}
