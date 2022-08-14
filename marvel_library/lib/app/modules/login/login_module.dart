import 'package:marvel_library/app/modules/login/domain/usecases/login_google_usecase.dart';
import 'package:marvel_library/app/modules/login/external/http/http_login_google.dart';
import 'package:marvel_library/app/modules/login/infra/repositories/login_google_repository_impl.dart';
import 'package:marvel_library/app/modules/login/presenter/login_page.dart';
import 'package:marvel_library/app/modules/login/presenter/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    // Login Google
    Bind.lazySingleton((i) => HttpLoginGoogle()),
    Bind.lazySingleton((i) => LoginGoogleRepositoryImpl(i())),
    Bind.lazySingleton((i) => LoginGoogleUsecase(i())),

    Bind.lazySingleton((i) => LoginStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SignInDemo()),
  ];
}
