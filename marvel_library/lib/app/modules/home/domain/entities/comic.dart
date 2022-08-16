import 'package:marvel_library/app/modules/home/domain/entities/character.dart';
import 'package:marvel_library/app/modules/home/domain/entities/creator.dart';
import 'package:marvel_library/app/modules/home/domain/entities/marvel_image.dart';
import 'package:marvel_library/app/modules/home/domain/entities/serie_summary.dart';

class Comic {
  MarvelImage? thumbnail;
  int id;
  String title;
  String? description;
  String? isbn;
  int? pageCount;
  Serie? serie;
  List<Character>? characterList;
  List<Creator>? creatorsList;
  List<MarvelImage>? gallery;
  bool favorited;
  int favoritedCount;
  Comic(
      {this.thumbnail,
      required this.id,
      required this.title,
      this.description,
      this.isbn,
      this.pageCount,
      this.serie,
      this.characterList,
      this.creatorsList,
      this.gallery,
      this.favorited = false,
      this.favoritedCount = 0});
}
