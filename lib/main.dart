import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokefun/pokefun_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await Hive.openBox('favorite_pokemons');

  await Future.delayed(const Duration(microseconds: 300));
  runApp(const PokefunApp());
}
