import 'package:dartz/dartz.dart';
import 'package:marvel_library/app/modules/home/domain/errors/errors.dart';
import 'package:marvel_library/app/modules/home/domain/repositories/get_comics_repository.dart';
import 'package:marvel_library/app/modules/home/infra/datasources/get_comics_datasource.dart';

class GetComicsRepositoryImpl implements GetComicsRepository {
  final GetComicsDatasource datasource;

  GetComicsRepositoryImpl(this.datasource);
  @override
  Future<Either<GetComicsException, ResponseGetComics>> getComics(
      ParamsGetComics params) async {
    return Right(await datasource.getComics(params));
    try {
      return Right(await datasource.getComics(params));
    } on GetComicsException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(GetComicsException(e.toString()));
    }
  }
}
