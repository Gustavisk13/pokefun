import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokefun/global/application/models/stat/pokemon_stat_model.dart';
import 'package:pokefun/global/application/models/stat/pokemon_stats_model.dart';

class StatIndicatorWidget extends StatelessWidget {
  final PokemonStatModel stat;
  final int value;
  const StatIndicatorWidget({super.key, required this.stat, required this.value});

  @override
  Widget build(BuildContext context) {
    return Text('${stat.name} - $value');
  }
}
