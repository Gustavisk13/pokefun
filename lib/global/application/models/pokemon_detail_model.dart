import 'package:pokefun/global/application/models/pokemon_ability_model.dart';
import 'package:pokefun/global/application/models/pokemon_type_model.dart';
import 'package:pokefun/global/domain/entity/pokemon_detail.dart';

import 'pokemon_move_model.dart';

class PokemonDetailModel {
  final int id;
  final String name;
  final String imageUrl;
  final int height;
  final int weight;
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;
  final List<PokemonTypeModel> types;
  final List<PokemonAbilityModel> abilities;
  final List<PokemonMoveModel> moves;

  PokemonDetailModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.height,
    required this.weight,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
    required this.types,
    required this.abilities,
    required this.moves,
  });

  factory PokemonDetailModel.fromEntity(PokemonDetail e) {
    return PokemonDetailModel(
      id: e.id,
      name: e.name,
      imageUrl: e.imageUrl,
      height: e.height,
      weight: e.weight,
      hp: e.hp,
      attack: e.attack,
      defense: e.defense,
      specialAttack: e.specialAttack,
      specialDefense: e.specialDefense,
      speed: e.speed,
      types: e.types.map((e) => PokemonTypeModel.fromEntity(e)).toList(),
      abilities: e.abilities.map((e) => PokemonAbilityModel.fromEntity(e)).toList(),
      moves: e.moves.map((e) => PokemonMoveModel.fromEntity(e)).toList(),
    );
  }

  PokemonDetail toEntity() {
    return PokemonDetail(
      id: id,
      name: name,
      imageUrl: imageUrl,
      height: height,
      weight: weight,
      hp: hp,
      attack: attack,
      defense: defense,
      specialAttack: specialAttack,
      specialDefense: specialDefense,
      speed: speed,
      types: types.map((type) => type.toEntity()).toList(),
      abilities: abilities.map((ability) => ability.toEntity()).toList(),
      moves: moves.map((move) => move.toEntity()).toList(),
    );
  }

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    final stats = json['stats'] as List;

    int hp = 0;
    int attack = 0;
    int defense = 0;
    int specialAttack = 0;
    int specialDefense = 0;
    int speed = 0;

    for (final stat in stats) {
      switch (stat['stat']['name']) {
        case 'hp':
          hp = stat['base_stat'];
          break;
        case 'attack':
          attack = stat['base_stat'];
          break;
        case 'defense':
          defense = stat['base_stat'];
          break;
        case 'special-attack':
          specialAttack = stat['base_stat'];
          break;
        case 'special-defense':
          specialDefense = stat['base_stat'];
          break;
        case 'speed':
          speed = stat['base_stat'];
          break;
      }
    }

    return PokemonDetailModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['sprites']['other']['home']['front_default'],
      height: json['height'],
      weight: json['weight'],
      hp: hp,
      attack: attack,
      defense: defense,
      specialAttack: specialAttack,
      specialDefense: specialDefense,
      speed: speed,
      types: json['types'].map<PokemonTypeModel>((e) => PokemonTypeModel.fromJson(e)).toList(),
      abilities: json['abilities'].map<PokemonAbilityModel>((e) => PokemonAbilityModel.fromJson(e)).toList(),
      moves: json['moves'].map<PokemonMoveModel>((e) => PokemonMoveModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'height': height,
      'weight': weight,
      'hp': hp,
      'attack': attack,
      'defense': defense,
      'specialAttack': specialAttack,
      'specialDefense': specialDefense,
      'speed': speed,
      'types': types.map((e) => e.toJson()).toList(),
      'abilities': abilities.map((e) => e.toJson()).toList(),
      'moves': moves.map((e) => e.toJson()).toList(),
    };
  }
}
