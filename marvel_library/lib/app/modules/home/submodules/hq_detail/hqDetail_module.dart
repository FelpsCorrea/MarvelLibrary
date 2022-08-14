import 'package:marvel_library/app/modules/home/submodules/hq_detail/hqDetail_Page.dart';
import 'package:marvel_library/app/modules/home/submodules/hq_detail/hqDetail_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HqDetailModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HqDetailStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HqDetailPage()),
  ];
}
