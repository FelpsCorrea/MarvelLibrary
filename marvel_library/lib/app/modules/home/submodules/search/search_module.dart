import 'package:marvel_library/app/modules/home/submodules/search/presenter/search_page.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/search_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SearchModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SearchStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SearchPage()),
  ];
}
