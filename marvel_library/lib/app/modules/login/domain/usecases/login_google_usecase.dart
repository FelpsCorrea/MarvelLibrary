import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marvel_library/app/modules/login/domain/errors/errors.dart';
import 'package:marvel_library/app/modules/login/domain/repositories/login_google_repository.dart';

abstract class ILoginGoogleUsecase {
  Future<Either<LoginGoogleException, GoogleSignInAccount>> call();
}

class LoginGoogleUsecase implements ILoginGoogleUsecase {
  final LoginGoogleRepository repository;

  LoginGoogleUsecase(this.repository);
  @override
  Future<Either<LoginGoogleException, GoogleSignInAccount>> call() async {
    return await repository.loginGoogle();
  }
}
