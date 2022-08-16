import 'package:marvel_library/app/modules/home/domain/entities/comic.dart';
import 'package:marvel_library/app/modules/home/domain/entities/creator.dart';
import 'package:marvel_library/app/modules/home/domain/entities/marvel_image.dart';
import 'package:marvel_library/app/modules/home/domain/repositories/get_creators_repository.dart';
import 'package:marvel_library/app/utils/verifications_utils.dart';

class GetCreatorsMapper {
  static ResponseGetCreators getResponseFromMap(Map object) {
    return ResponseGetCreators(
        total: object['total'],
        offset: object['offset'],
        creators: getCreatorsFromResultList(object['results']));
  }

  static List<Creator> getCreatorsFromResultList(List list) {
    return list
        .map((e) => Creator(
            id: e['id'],
            name: e['fullName'],
            thumbnail: VerificationsUtils.isNotEmpty(e['thumbnail'].toString())
                ? MarvelImage(
                    path: e['thumbnail']['path'],
                    extension: e['thumbnail']['extension'])
                : null,
            comicList: getCharactersFromItems(e['comics']['items'])))
        .toList();
  }

  static List<Comic> getCharactersFromItems(List list) {
    return list
        .map((e) =>
            Comic(id: getIdFromResourceURI(e['resourceURI']), title: e['name']))
        .toList();
  }

  static int getIdFromResourceURI(String resourceURI) {
    int index = resourceURI.lastIndexOf("/") + 1;
    return int.parse(resourceURI.toString().substring(index));
  }
}
