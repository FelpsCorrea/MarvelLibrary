import 'package:marvel_library/app/modules/home/submodules/profile/profile_Page.dart';
import 'package:marvel_library/app/modules/home/submodules/profile/profile_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProfileStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ProfilePage()),
  ];
}
