import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/submodules/favorites/presenter/favorites_page.dart';
import 'package:marvel_library/app/modules/home/submodules/favorites/presenter/favorites_store.dart';

class FavoritesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => FavoritesStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => FavoritesPage()),
  ];
}
