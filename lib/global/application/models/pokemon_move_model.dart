import 'package:pokefun/global/domain/entity/move.dart';

class PokemonMoveModel {
  final String name;
  final String url;

  PokemonMoveModel({
    required this.name,
    required this.url,
  });

  factory PokemonMoveModel.fromEntity(Move e) {
    return PokemonMoveModel(
      name: e.name,
      url: e.url,
    );
  }

  Move toEntity() {
    return Move(
      name: name,
      url: url,
    );
  }

  factory PokemonMoveModel.fromJson(Map<String, dynamic> json) {
    return PokemonMoveModel(
      name: json['move']['name'],
      url: json['move']['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}
