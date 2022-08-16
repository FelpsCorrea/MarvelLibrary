import 'package:dartz/dartz.dart';
import 'package:marvel_library/app/modules/home/domain/errors/errors.dart';
import 'package:marvel_library/app/modules/home/domain/repositories/get_creators_repository.dart';
import 'package:marvel_library/app/modules/home/infra/datasources/get_creators_datasource.dart';

class GetCreatorsRepositoryImpl implements GetCreatorsRepository {
  final GetCreatorsDatasource datasource;

  GetCreatorsRepositoryImpl(this.datasource);
  @override
  Future<Either<GetCreatorsException, ResponseGetCreators>> getCreators(
      ParamsGetCreators params) async {
    try {
      return Right(await datasource.getCreators(params));
    } on GetCreatorsException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(GetCreatorsException(e.toString()));
    }
  }
}