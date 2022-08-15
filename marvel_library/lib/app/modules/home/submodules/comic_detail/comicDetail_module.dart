import 'package:marvel_library/app/modules/home/submodules/comic_detail/comicDetail_Page.dart';
import 'package:marvel_library/app/modules/home/submodules/comic_detail/comicDetail_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ComicDetailModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ComicDetailStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ComicDetailPage()),
  ];
}
