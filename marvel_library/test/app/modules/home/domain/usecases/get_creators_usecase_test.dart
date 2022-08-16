import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_library/app/modules/home/domain/repositories/get_creators_repository.dart';
import 'package:marvel_library/app/modules/home/domain/usecases/get_creators_usecase.dart';
import 'package:marvel_library/app/modules/home/external/http/http_get_creators.dart';
import 'package:marvel_library/app/modules/home/infra/repositories/get_creators_repository_impl.dart';

void main() {
  final datasource = HttpGetCreators();
  final repository = GetCreatorsRepositoryImpl(datasource);
  final usecase = GetCreatorsUsecase(repository);
  test('get creators usecase ...', () async {
    final result = await usecase(ParamsGetCreators());

    expect(result.fold(id, id), isA<ResponseGetCreators>());
  });
}