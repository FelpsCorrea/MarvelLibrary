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
  List<int>? characters; //IDS Separados por vírgula
  List<int>? creators; //IDS Separados por vírgula
  String? orderBy; //title, -title
  int limit;
  int offset;
  ParamsGetComics(
      {this.title,
      this.titleStartsWith,
      this.characters,
      this.creators,
      this.orderBy,
      this.limit = 10,
      this.offset = 0});
}

class ResponseGetComics {
  int total;
  List<Comic> comics;
  ResponseGetComics({
    required this.total,
    required this.comics,
  });
}
