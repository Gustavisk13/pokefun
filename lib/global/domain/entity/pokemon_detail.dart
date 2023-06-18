import 'package:pokefun/global/domain/entity/ability.dart';
import 'package:pokefun/global/domain/entity/move.dart';
import 'package:pokefun/global/domain/entity/pokemon.dart';
import 'package:pokefun/global/domain/entity/type.dart';

typedef Type = PokemonType;

class PokemonDetail extends Pokemon {
  final int height;
  final int weight;
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;
  final List<Type> types;
  final List<Ability> abilities;
  final List<Move> moves;

  PokemonDetail({
    required int id,
    required String name,
    required String imageUrl,
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
  }) : super(
          id: id,
          name: name,
          imageUrl: imageUrl,
        );
}
