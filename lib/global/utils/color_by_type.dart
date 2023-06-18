import 'package:flutter/material.dart';
import 'package:pokefun/global/enum/pokemon_types_enum.dart';

class ColorByType {
  static Color getColor({required PokemonTypes type}) {
    switch (type) {
      case PokemonTypes.bug:
        return Colors.lightGreen;
      case PokemonTypes.dark:
        return Colors.brown;
      case PokemonTypes.dragon:
        return Colors.indigo;
      case PokemonTypes.electric:
        return Colors.yellow;
      case PokemonTypes.fairy:
        return Colors.pink;
      case PokemonTypes.fighting:
        return Colors.red;
      case PokemonTypes.fire:
        return Colors.orange;
      case PokemonTypes.flying:
        return Colors.lightBlue;
      case PokemonTypes.ghost:
        return Colors.purple;
      case PokemonTypes.grass:
        return Colors.green;
      case PokemonTypes.ground:
        return Colors.brown;
      case PokemonTypes.ice:
        return Colors.cyan;
      case PokemonTypes.normal:
        return Colors.grey;
      case PokemonTypes.poison:
        return Colors.purple;
      case PokemonTypes.psychic:
        return Colors.pink;
      case PokemonTypes.rock:
        return Colors.brown;
      case PokemonTypes.steel:
        return Colors.grey;
      case PokemonTypes.water:
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
