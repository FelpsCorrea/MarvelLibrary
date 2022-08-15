import 'package:marvel_library/app/modules/home/domain/entities/character.dart';
import 'package:marvel_library/app/modules/home/domain/entities/comic.dart';
import 'package:marvel_library/app/modules/home/domain/entities/marvel_image.dart';
import 'package:marvel_library/app/modules/home/domain/repositories/get_characters_repository.dart';
import 'package:marvel_library/app/utils/verifications_utils.dart';

class GetCharactersMapper {
  static ResponseGetCharacters getResponseFromMap(Map object) {
    return ResponseGetCharacters(
        total: object['total'],
        characters: getCharactersFromResultList(object['results']));
  }

  static List<Character> getCharactersFromResultList(List list) {
    return list
        .map((e) => Character(
            id: e['id'],
            name: e['name'],
            description: VerificationsUtils.isNotEmpty(e['description'])
                ? e['description']
                : null,
            thumbnail: VerificationsUtils.isNotEmpty(e['thumbnail'].toString())
                ? MarvelImage(
                    path: e['thumbnail']['path'],
                    extension: e['thumbnail']['extension'])
                : null,
            comicList: getComicsFromItems(e['comics']['items'])))
        .toList();
  }

  static List<Comic> getComicsFromItems(List list) {
    return list
        .map((e) => Comic(
            id: int.parse(e['resourceURI']
                .toString()
                .substring(getStartComicIdFromResourceURI(e['resourceURI']))),
            title: e['name']))
        .toList();
  }

  static int getStartComicIdFromResourceURI(String resourceURI) {
    return resourceURI.lastIndexOf("/") + 1;
  }
}
