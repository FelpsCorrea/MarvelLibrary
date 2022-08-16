import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/domain/usecases/get_characters_usecase.dart';
import 'package:marvel_library/app/modules/home/external/http/http_get_characters.dart';
import 'package:marvel_library/app/modules/home/infra/repositories/get_characters_repository_impl.dart';
import 'package:marvel_library/app/modules/home/submodules/favorites/favorites_module.dart';
import 'package:marvel_library/app/modules/home/submodules/profile/profile_module.dart';
import 'package:marvel_library/app/modules/home/submodules/search/search_module.dart';
import 'package:marvel_library/app/modules/home/submodules/start/start_module.dart';
import 'package:marvel_library/app/modules/login/domain/usecases/login_google_usecase.dart';
import 'package:marvel_library/app/modules/login/external/http/http_login_google.dart';
import 'package:marvel_library/app/modules/login/infra/repositories/login_google_repository_impl.dart';
import 'presenter/home_store.dart';

import 'presenter/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    // Login Google
    Bind.lazySingleton((i) => HttpLoginGoogle()),
    Bind.lazySingleton((i) => LoginGoogleRepositoryImpl(i())),
    Bind.lazySingleton((i) => LoginGoogleUsecase(i())),

    // Get Characters
    Bind.lazySingleton((i) => HttpGetCharacters()),
    Bind.lazySingleton((i) => GetCharactersRepositoryImpl(i())),
    Bind.lazySingleton((i) => GetCharactersUsecase(i())),

    Bind.lazySingleton((i) => HomeStore(i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) {
      return HomePage();
    }, children: [
      ModuleRoute("/start/",
          module: StartModule(),
          transition: TransitionType.downToUp,
          duration: Duration(milliseconds: 500)),
      ModuleRoute('/search/',
          module: SearchModule(),
          transition: TransitionType.downToUp,
          duration: Duration(milliseconds: 500)),
      ModuleRoute('/favorites/',
          module: FavoritesModule(),
          transition: TransitionType.downToUp,
          duration: Duration(milliseconds: 500)),
      ModuleRoute('/profile/',
          module: ProfileModule(),
          transition: TransitionType.downToUp,
          duration: Duration(milliseconds: 500))
    ]),
  ];
}
