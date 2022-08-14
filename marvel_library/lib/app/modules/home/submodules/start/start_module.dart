import 'package:marvel_library/app/modules/home/submodules/start/start_Page.dart';
import 'package:marvel_library/app/modules/home/submodules/start/start_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StartModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => StartStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => StartPage()),
  ];
}
