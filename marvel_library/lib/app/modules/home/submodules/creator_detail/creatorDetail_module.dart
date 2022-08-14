import 'package:marvel_library/app/modules/home/submodules/creator_detail/creatorDetail_Page.dart';
import 'package:marvel_library/app/modules/home/submodules/creator_detail/creatorDetail_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreatorDetailModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CreatorDetailStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => CreatorDetailPage()),
  ];
}
