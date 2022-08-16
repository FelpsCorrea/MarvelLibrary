import 'package:dartz/dartz.dart';
import 'package:marvel_library/app/modules/home/domain/entities/creator.dart';
import 'package:marvel_library/app/modules/home/domain/errors/errors.dart';

abstract class GetCreatorsRepository {
  Future<Either<GetCreatorsException, ResponseGetCreators>> getCreators(
      ParamsGetCreators params);
}

class ParamsGetCreators {
  String? title;
  String? nameStartsWith;
  List<int>? comics; //IDS Separados por vírgula
  String? orderBy; //firstName, -firstName
  int limit;
  int offset;
  ParamsGetCreators(
      {this.title,
      this.nameStartsWith,
      this.comics,
      this.orderBy,
      this.limit = 10,
      this.offset = 0});
}

class ResponseGetCreators {
  int total;
  List<Creator> creators;
  ResponseGetCreators({
    required this.total,
    required this.creators,
  });
}