import 'package:pokefun/global/application/models/ability/pokemon_abilities_model.dart';
import 'package:pokefun/global/application/models/ability/pokemon_ability_model.dart';
import 'package:pokefun/global/application/models/stat/pokemon_stats_model.dart';
import 'package:pokefun/global/application/models/type/pokemon_types_model.dart';
import 'package:pokefun/global/domain/entity/pokemon_detail.dart';
import 'package:pokefun/global/enums/pokemon_type.dart';

import 'pokemon_move_model.dart';

class PokemonDetailModel {
  final int id;
  final String name;
  final String imageUrl;
  final int height;
  final int weight;
  final List<PokemonStatsModel> stats;
  final List<PokemonTypesModel> types;
  final List<PokemonAbilitiesModel> abilities;
  final List<PokemonMoveModel> moves;

  PokemonDetailModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.height,
    required this.weight,
    required this.stats,
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
      stats: e.stats.map((e) => PokemonStatsModel.fromEntity(e)).toList(),
      types: e.types.map((e) => PokemonTypesModel.fromEntity(e)).toList(),
      abilities: e.abilities.map((e) => PokemonAbilitiesModel.fromEntity(e)).toList(),
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
      stats: stats.map((e) => e.toEntity()).toList(),
      types: types.map((e) => e.toEntity()).toList(),
      abilities: abilities.map((e) => e.toEntity()).toList(),
      moves: moves.map((e) => e.toEntity()).toList(),
    );
  }

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    return PokemonDetailModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['sprites']['other']['home']['front_default'],
      height: json['height'],
      weight: json['weight'],
      stats: json['stats'].map<PokemonStatsModel>((e) => PokemonStatsModel.fromJson(e)).toList(),
      types: json['types'].map<PokemonTypesModel>((e) => PokemonTypesModel.fromJson(e)).toList(),
      abilities: json['abilities'].map<PokemonAbilitiesModel>((e) => PokemonAbilitiesModel.fromJson(e)).toList(),
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
      'stats': stats.map((e) => e.toJson()).toList(),
      'types': types.map((e) => e.toJson()).toList(),
      'abilities': abilities.map((e) => e.toJson()).toList(),
      'moves': moves.map((e) => e.toJson()).toList(),
    };
  }
}
