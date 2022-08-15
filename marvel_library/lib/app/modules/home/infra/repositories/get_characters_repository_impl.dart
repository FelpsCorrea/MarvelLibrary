import 'package:dartz/dartz.dart';
import 'package:marvel_library/app/modules/home/domain/errors/errors.dart';
import 'package:marvel_library/app/modules/home/domain/repositories/get_characters_repository.dart';
import 'package:marvel_library/app/modules/home/infra/datasources/get_characters_datasource.dart';

class GetCharactersRepositoryImpl implements GetCharactersRepository {
  final GetCharactersDatasource datasource;

  GetCharactersRepositoryImpl(this.datasource);
  @override
  Future<Either<GetCharactersException, ResponseGetCharacters>> getCharacters(
      ParamsGetCharacters params) async {
    try {
      return Right(await datasource.getCharacters(params));
    } on GetCharactersException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(GetCharactersException(e.toString()));
    }
  }
}
