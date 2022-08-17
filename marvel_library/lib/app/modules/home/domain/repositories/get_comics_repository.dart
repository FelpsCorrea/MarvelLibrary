import 'package:dartz/dartz.dart';
import 'package:marvel_library/app/modules/home/domain/entities/comic.dart';
import 'package:marvel_library/app/modules/home/domain/errors/errors.dart';

abstract class GetComicsRepository {
  Future<Either<GetComicsException, ResponseGetComics>> getComics(
      ParamsGetComics params);
}

class ParamsGetComics {
  String? title;
  String? titleStartsWith;
  int? comicId;
  List<int>? characters; //IDS Separados por vírgula
  List<int>? creators; //IDS Separados por vírgula
  String? orderBy; //title, -title
  int limit;
  int offset;
  ParamsGetComics(
      {this.comicId,
      this.title,
      this.titleStartsWith,
      this.characters,
      this.creators,
      this.orderBy = 'modified',
      this.limit = 10,
      this.offset = 0});
}

class ResponseGetComics {
  int total;
  int offset;
  List<Comic> comics;
  ResponseGetComics({
    required this.total,
    required this.offset,
    required this.comics,
  });
}
