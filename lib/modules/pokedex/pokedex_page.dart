import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokefun/global/data/pokeapi/pokeapi_datasource.dart';
import 'package:pokefun/global/themes/app_themes.dart';
import 'package:pokefun/global/widgets/label_app_bar.dart';

class PokedexPage extends StatelessWidget {
  const PokedexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: LabelAppBar(
          context: context,
          valueActions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Pokedex Page'),
              ElevatedButton(
                onPressed: () async {
                  PokeapiDatasource datasource = PokeapiDatasource();

                  await datasource.getPokemon(1).then((value) {
                    log(value.name);
                  });
                },
                child: Text('Test'),
              )
            ],
          ),
        ));
  }
}
