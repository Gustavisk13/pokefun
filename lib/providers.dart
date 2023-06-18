import 'package:pokefun/global/routes/app_router.dart';
import 'package:pokefun/modules/pokedex/provider/pokedex_provider.dart';
import 'package:pokefun/modules/pokemon/providers/pokemon_provider.dart';
import 'package:provider/provider.dart';

class Providers {
  static final providers = [
    Provider<AppRouter>(
      create: (_) => AppRouter(),
    ),
    ...PokedexProviders.providers,
    ...PokemonProviders.providers,
  ];
}
