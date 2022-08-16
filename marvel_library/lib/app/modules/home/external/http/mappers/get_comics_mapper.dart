import 'package:marvel_library/app/modules/home/domain/entities/character.dart';
import 'package:marvel_library/app/modules/home/domain/entities/comic.dart';
import 'package:marvel_library/app/modules/home/domain/entities/creator.dart';
import 'package:marvel_library/app/modules/home/domain/entities/marvel_image.dart';
import 'package:marvel_library/app/modules/home/domain/entities/serie_summary.dart';
import 'package:marvel_library/app/modules/home/domain/repositories/get_comics_repository.dart';
import 'package:marvel_library/app/utils/verifications_utils.dart';

class GetComicsMapper {
  static ResponseGetComics getResponseFromMap(Map object) {
    return ResponseGetComics(
        total: object['total'],
        offset: object['offset'],
        comics: getComicsFromResultList(object['results']));
  }

  static List<Comic> getComicsFromResultList(List list) {
    return list
        .map((e) => Comic(
            id: e['id'],
            title: e['title'],
            description: VerificationsUtils.isNotEmpty(e['description'])
                ? e['description']
                : null,
            pageCount: VerificationsUtils.isNotEmpty(e['pageCount'].toString())
                ? e['pageCount']
                : null,
            isbn: VerificationsUtils.isNotEmpty(e['isbn']) ? e['isbn'] : null,
            serie: VerificationsUtils.isNotEmpty(e['series'].toString())
                ? Serie(
                    id: getIdFromResourceURI(e['series']['resourceURI']),
                    name: e['series']['name'])
                : null,
            thumbnail: VerificationsUtils.isNotEmpty(e['thumbnail'].toString())
                ? MarvelImage(
                    path: e['thumbnail']['path'],
                    extension: e['thumbnail']['extension'])
                : null,
            characterList: getCharactersFromItems(e['characters']['items']),
            creatorsList: getCreatorsFromItems(e['creators']['items'])))
        .toList();
  }

  static List<Character> getCharactersFromItems(List list) {
    return list
        .map((e) => Character(
            id: getIdFromResourceURI(e['resourceURI']), name: e['name']))
        .toList();
  }

  static List<Creator> getCreatorsFromItems(List list) {
    return list
        .map((e) => Creator(
            id: getIdFromResourceURI(e['resourceURI']), name: e['name']))
        .toList();
  }

  static int getIdFromResourceURI(String resourceURI) {
    int index = resourceURI.lastIndexOf("/") + 1;
    return int.parse(resourceURI.toString().substring(index));
  }
}
