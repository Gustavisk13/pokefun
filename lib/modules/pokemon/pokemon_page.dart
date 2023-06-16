import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    log('PokemonPage');
    return const Scaffold(
        body: Center(
      child: Text('Pokemon Page'),
    ));
  }
}
