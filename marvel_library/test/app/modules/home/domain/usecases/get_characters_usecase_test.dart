import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_library/app/modules/home/domain/repositories/get_characters_repository.dart';
import 'package:marvel_library/app/modules/home/domain/usecases/get_characters_usecase.dart';
import 'package:marvel_library/app/modules/home/external/http/http_get_characters.dart';
import 'package:marvel_library/app/modules/home/infra/repositories/get_characters_repository_impl.dart';

void main() {
  final datasource = HttpGetCharacters();
  final repository = GetCharactersRepositoryImpl(datasource);
  final usecase = GetCharactersUsecase(repository);
  test('get characters usecase ...', () async {
    final result = await usecase(ParamsGetCharacters());

    expect(result.fold(id, id), isA<ResponseGetCharacters>());
  });
}
