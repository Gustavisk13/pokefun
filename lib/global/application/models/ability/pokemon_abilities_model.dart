import 'package:pokefun/global/application/models/ability/pokemon_ability_model.dart';
import 'package:pokefun/global/domain/entity/abilities.dart';

class PokemonAbilitiesModel {
  final PokemonAbilityModel ability;
  final bool isHidden;
  final int slot;

  PokemonAbilitiesModel({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory PokemonAbilitiesModel.fromEntity(Abilities abilities) {
    return PokemonAbilitiesModel(
      ability: PokemonAbilityModel.fromEntity(abilities.ability),
      isHidden: abilities.isHidden,
      slot: abilities.slot,
    );
  }

  Abilities toEntity() {
    return Abilities(
      ability: ability.toEntity(),
      isHidden: isHidden,
      slot: slot,
    );
  }

  factory PokemonAbilitiesModel.fromJson(Map<String, dynamic> json) {
    return PokemonAbilitiesModel(
      ability: PokemonAbilityModel.fromJson(json['ability']),
      isHidden: json['is_hidden'],
      slot: json['slot'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ability': ability.toJson(),
      'is_hidden': isHidden,
      'slot': slot,
    };
  }
}
