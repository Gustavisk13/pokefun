import 'package:flutter/material.dart';
import 'package:pokefun/pokefun_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.delayed(const Duration(microseconds: 300));
  runApp(const PokefunApp());
}
