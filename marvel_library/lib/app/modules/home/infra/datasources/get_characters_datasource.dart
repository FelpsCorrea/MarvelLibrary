import 'package:marvel_library/app/modules/home/domain/repositories/get_characters_repository.dart';

abstract class GetCharactersDatasource {
  Future<ResponseGetCharacters> getCharacters(ParamsGetCharacters params);
}
