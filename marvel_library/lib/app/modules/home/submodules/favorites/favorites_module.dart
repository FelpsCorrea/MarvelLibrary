import 'package:marvel_library/app/modules/home/submodules/favorites/favorites_Page.dart';
import 'package:marvel_library/app/modules/home/submodules/favorites/favorites_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
