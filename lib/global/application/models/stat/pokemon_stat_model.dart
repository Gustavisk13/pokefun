import 'package:pokefun/global/domain/entity/stat.dart';

class PokemonStatModel {
  final String name;
  final String url;

  PokemonStatModel({
    required this.name,
    required this.url,
  });

  factory PokemonStatModel.fromEntity(Stat stat) {
    return PokemonStatModel(
      name: stat.name,
      url: stat.url,
    );
  }

  Stat toEntity() {
    return Stat(
      name: name,
      url: url,
    );
  }

  factory PokemonStatModel.fromJson(Map<String, dynamic> json) {
    return PokemonStatModel(
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
