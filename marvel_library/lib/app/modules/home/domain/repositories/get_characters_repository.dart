import 'package:dartz/dartz.dart';
import 'package:marvel_library/app/modules/home/domain/entities/character.dart';
import 'package:marvel_library/app/modules/home/domain/errors/errors.dart';

abstract class GetCharactersRepository {
  Future<Either<GetCharactersException, ResponseGetCharacters>> getCharacters(
      ParamsGetCharacters params);
}

class ParamsGetCharacters {
  String? name;
  String? nameStartsWith;
  List<int>? comics; //IDS Separados por vírgula
  String? orderBy; //name, modified, -name, -modified
  int limit;
  int offset;
  ParamsGetCharacters(
      {this.name,
      this.nameStartsWith,
      this.comics,
      this.orderBy,
      this.limit = 10,
      this.offset = 0});
}

class ResponseGetCharacters {
  int total;
  List<Character> characters;
  ResponseGetCharacters({
    required this.total,
    required this.characters,
  });
}
