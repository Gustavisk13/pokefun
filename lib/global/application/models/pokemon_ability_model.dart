import 'dart:developer';

import 'package:pokefun/global/domain/entity/ability.dart';

class PokemonAbilityModel {
  final String ability;
  final bool isHidden;
  final int slot;

  PokemonAbilityModel({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory PokemonAbilityModel.fromEntity(Ability e) {
    return PokemonAbilityModel(
      ability: e.ability,
      isHidden: e.isHidden,
      slot: e.slot,
    );
  }

  Ability toEntity() {
    return Ability(
      ability: ability,
      isHidden: isHidden,
      slot: slot,
    );
  }

  factory PokemonAbilityModel.fromJson(Map<String, dynamic> json) {
    return PokemonAbilityModel(
      ability: json['ability']['name'],
      isHidden: json['is_hidden'],
      slot: json['slot'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ability': ability,
      'is_hidden': isHidden,
      'slot': slot,
    };
  }
}
