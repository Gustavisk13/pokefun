import 'package:pokefun/global/domain/entity/type.dart';

class PokemonTypeModel {
  final int slot;
  final String type;
  final String url;

  PokemonTypeModel({
    required this.slot,
    required this.type,
    required this.url,
  });

  factory PokemonTypeModel.fromEntity(PokemonType e) {
    return PokemonTypeModel(
      slot: e.slot,
      type: e.type,
      url: e.url,
    );
  }

  PokemonType toEntity() {
    return PokemonType(
      slot: slot,
      type: type,
      url: url,
    );
  }

  factory PokemonTypeModel.fromJson(Map<String, dynamic> json) {
    return PokemonTypeModel(
      slot: json['slot'],
      type: json['type']['name'],
      url: json['type']['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'slot': slot,
      'type': type,
      'url': url,
    };
  }
}
