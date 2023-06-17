import 'package:pokefun/global/domain/entity/abilities.dart';
import 'package:pokefun/global/domain/entity/ability.dart';
import 'package:pokefun/global/domain/entity/move.dart';
import 'package:pokefun/global/domain/entity/pokemon.dart';
import 'package:pokefun/global/domain/entity/stats.dart';
import 'package:pokefun/global/domain/entity/types.dart';
import 'package:pokefun/global/enums/pokemon_type.dart';

class PokemonDetail extends Pokemon {
  final int height;
  final int weight;
  final List<Stats> stats;
  final List<Types> types;
  final List<Abilities> abilities;
  final List<Move> moves;

  PokemonDetail({
    required int id,
    required String name,
    required String imageUrl,
    required this.height,
    required this.weight,
    required this.stats,
    required this.types,
    required this.abilities,
    required this.moves,
  }) : super(
          id: id,
          name: name,
          imageUrl: imageUrl,
        );
}
