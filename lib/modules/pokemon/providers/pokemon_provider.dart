import 'package:pokefun/modules/pokemon/controller/pokemon_controller.dart';
import 'package:provider/provider.dart';

class PokemonProvider {
  static final providers = [
    ChangeNotifierProvider(
      create: (_) => PokemonController(),
    ),
  ];
}
