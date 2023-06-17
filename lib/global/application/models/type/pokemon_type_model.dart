import 'package:pokefun/global/domain/entity/type.dart';

class PokemonTypeModel {
  String name;
  String url;

  PokemonTypeModel({
    required this.name,
    required this.url,
  });

  factory PokemonTypeModel.fromEntity(PokemonType e) {
    return PokemonTypeModel(
      name: e.name,
      url: e.url,
    );
  }

  PokemonType toEntity() {
    return PokemonType(
      name: name,
      url: url,
    );
  }

  factory PokemonTypeModel.fromJson(Map<String, dynamic> json) {
    return PokemonTypeModel(
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
