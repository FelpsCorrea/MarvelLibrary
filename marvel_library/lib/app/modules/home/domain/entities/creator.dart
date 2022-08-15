import 'package:marvel_library/app/modules/home/domain/entities/comic.dart';
import 'package:marvel_library/app/modules/home/domain/entities/marvel_image.dart';

class Creator {
  int id;
  String name;
  String? description;
  MarvelImage? thumbnail;
  List<Comic>? comicList;
  bool favorited;
  int favoritedCount;
  Creator({
    required this.id,
    required this.name,
    this.description,
    this.thumbnail,
    this.comicList,
    this.favorited = false,
    this.favoritedCount = 0,
  });
}
