import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_library/app/modules/home/domain/repositories/get_comics_repository.dart';
import 'package:marvel_library/app/modules/home/domain/usecases/get_comics_usecase.dart';
import 'package:marvel_library/app/modules/home/external/http/http_get_comics.dart';
import 'package:marvel_library/app/modules/home/infra/repositories/get_comics_repository_impl.dart';

void main() {
  final datasource = HttpGetComics();
  final repository = GetComicsRepositoryImpl(datasource);
  final usecase = GetComicsUsecase(repository);
  test('get comics usecase ...', () async {
    final result = await usecase(ParamsGetComics());

    expect(result.fold(id, id), isA<ResponseGetComics>());
  });
}
