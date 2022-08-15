import 'package:dartz/dartz.dart';
import 'package:marvel_library/app/modules/home/domain/errors/errors.dart';
import 'package:marvel_library/app/modules/home/domain/repositories/get_characters_repository.dart';

abstract class IGetCharactersUsecase {
  Future<Either<GetCharactersException, ResponseGetCharacters>> call(
      ParamsGetCharacters params);
}

class GetCharactersUsecase implements IGetCharactersUsecase {
  final GetCharactersRepository repository;

  GetCharactersUsecase(this.repository);
  @override
  Future<Either<GetCharactersException, ResponseGetCharacters>> call(
      ParamsGetCharacters params) async {
    return await repository.getCharacters(params);
  }
}
