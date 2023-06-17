import 'package:pokefun/global/domain/entity/ability.dart';

class PokemonAbilityModel {
  final String name;
  final String url;

  PokemonAbilityModel({
    required this.name,
    required this.url,
  });

  factory PokemonAbilityModel.fromEntity(Ability e) {
    return PokemonAbilityModel(
      name: e.name,
      url: e.url,
    );
  }

  Ability toEntity() {
    return Ability(
      name: name,
      url: url,
    );
  }

  factory PokemonAbilityModel.fromJson(Map<String, dynamic> json) {
    return PokemonAbilityModel(
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}
