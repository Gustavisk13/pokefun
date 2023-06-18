import 'package:pokefun/modules/pokedex/controller/pokedex_controller.dart';
import 'package:provider/provider.dart';

class PokedexProviders {
  static final providers = [
    ChangeNotifierProvider<PokedexController>(
      create: (_) => PokedexController(),
    ),
  ];
}
