import 'package:dartz/dartz.dart';
import 'package:marvel_library/app/modules/home/domain/errors/errors.dart';
import 'package:marvel_library/app/modules/home/domain/repositories/get_comics_repository.dart';

abstract class IGetComicsUsecase {
  Future<Either<GetComicsException, ResponseGetComics>> call(
      ParamsGetComics params);
}

class GetComicsUsecase implements IGetComicsUsecase {
  final GetComicsRepository repository;

  GetComicsUsecase(this.repository);
  @override
  Future<Either<GetComicsException, ResponseGetComics>> call(
      ParamsGetComics params) async {
    return await repository.getComics(params);
  }
}
