import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/home_module.dart';
import 'package:marvel_library/app/modules/login/login_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/home/',
        module: HomeModule(),
        transition: TransitionType.fadeIn,
        duration: Duration(milliseconds: 1000)),
    ModuleRoute('/',
        module: LoginModule(),
        transition: TransitionType.fadeIn,
        duration: Duration(milliseconds: 1000)),
  ];
}
