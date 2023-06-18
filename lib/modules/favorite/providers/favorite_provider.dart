import 'package:pokefun/modules/favorite/controller/favorite_controller.dart';
import 'package:provider/provider.dart';

class FavoriteProvider {
  static final providers = [
    ChangeNotifierProvider(
      create: (_) => FavoriteController(),
    ),
  ];
}
