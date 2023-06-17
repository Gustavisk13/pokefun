import 'package:pokefun/global/domain/entity/ability.dart';

class Abilities {
  final Ability ability;
  final bool isHidden;
  final int slot;

  Abilities({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });
}
