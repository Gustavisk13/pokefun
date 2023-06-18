import 'package:pokefun/global/application/models/stat/pokemon_stat_model.dart';
import 'package:pokefun/global/domain/entity/stats.dart';

class PokemonStatsModel {
  final int baseStat;
  final int effort;
  final PokemonStatModel stat;

  PokemonStatsModel({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  PokemonStatModel get current => stat;

  factory PokemonStatsModel.fromEntity(Stats stats) {
    return PokemonStatsModel(
      baseStat: stats.baseStat,
      effort: stats.effort,
      stat: PokemonStatModel.fromEntity(stats.stat),
    );
  }

  Stats toEntity() {
    return Stats(
      baseStat: baseStat,
      effort: effort,
      stat: stat.toEntity(),
    );
  }

  factory PokemonStatsModel.fromJson(Map<String, dynamic> json) {
    return PokemonStatsModel(
      baseStat: json['base_stat'],
      effort: json['effort'],
      stat: PokemonStatModel.fromJson(json['stat']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'base_stat': baseStat,
      'effort': effort,
      'stat': stat.toJson(),
    };
  }
}
