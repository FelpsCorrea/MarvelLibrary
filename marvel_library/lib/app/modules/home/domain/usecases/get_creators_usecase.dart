import 'package:dartz/dartz.dart';
import 'package:marvel_library/app/modules/home/domain/errors/errors.dart';
import 'package:marvel_library/app/modules/home/domain/repositories/get_creators_repository.dart';

abstract class IGetCreatorsUsecase {
  Future<Either<GetCreatorsException, ResponseGetCreators>> call(
      ParamsGetCreators params);
}

class GetCreatorsUsecase implements IGetCreatorsUsecase {
  final GetCreatorsRepository repository;

  GetCreatorsUsecase(this.repository);
  @override
  Future<Either<GetCreatorsException, ResponseGetCreators>> call(
      ParamsGetCreators params) async {
    return await repository.getCreators(params);
  }
}