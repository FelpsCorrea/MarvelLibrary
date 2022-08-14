import 'package:marvel_library/app/modules/home/submodules/character_detail/characterDetail_Page.dart';
import 'package:marvel_library/app/modules/home/submodules/character_detail/characterDetail_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CharacterDetailModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CharacterDetailStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => CharacterDetailPage()),
  ];
}
