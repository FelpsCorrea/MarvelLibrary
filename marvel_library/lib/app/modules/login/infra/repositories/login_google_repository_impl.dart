import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marvel_library/app/modules/login/domain/errors/errors.dart';
import 'package:marvel_library/app/modules/login/domain/repositories/login_google_repository.dart';
import 'package:marvel_library/app/modules/login/infra/datasources/login_google_datasource.dart';

class LoginGoogleRepositoryImpl implements LoginGoogleRepository {
  final LoginGoogleDatasource datasource;

  LoginGoogleRepositoryImpl(this.datasource);
  @override
  Future<Either<LoginGoogleException, GoogleSignInAccount>>
      loginGoogle() async {
    try {
      return Right(await datasource.loginGoogle());
    } on LoginGoogleException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(LoginGoogleException(e.toString()));
    }
  }
}
