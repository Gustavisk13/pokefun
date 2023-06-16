import 'package:pokefun/global/routes/app_router.dart';
import 'package:provider/provider.dart';

class Providers {
  static final providers = [
    Provider<AppRouter>(
      create: (_) => AppRouter(),
    ),
  ];
}
