import 'package:marvel_library/app/modules/home/domain/repositories/get_comics_repository.dart';

abstract class GetComicsDatasource {
  Future<ResponseGetComics> getComics(ParamsGetComics params);
}
