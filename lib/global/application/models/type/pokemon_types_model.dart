import 'package:pokefun/global/application/models/type/pokemon_type_model.dart';
import 'package:pokefun/global/domain/entity/types.dart';

class PokemonTypesModel {
  final int slot;
  final PokemonTypeModel type;

  PokemonTypesModel({
    required this.slot,
    required this.type,
  });

  factory PokemonTypesModel.fromEntity(Types types) {
    return PokemonTypesModel(
      slot: types.slot,
      type: PokemonTypeModel.fromEntity(types.type),
    );
  }

  Types toEntity() {
    return Types(
      slot: slot,
      type: type.toEntity(),
    );
  }

  factory PokemonTypesModel.fromJson(Map<String, dynamic> json) {
    return PokemonTypesModel(
      slot: json['slot'],
      type: PokemonTypeModel.fromJson(json['type']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'slot': slot,
      'type': type.toJson(),
    };
  }
}
