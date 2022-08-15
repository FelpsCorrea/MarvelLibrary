import 'package:marvel_library/app/modules/home/domain/entities/character.dart';
import 'package:marvel_library/app/modules/home/domain/entities/marvel_image.dart';
import 'package:marvel_library/app/modules/home/domain/entities/serie_summary.dart';

class Comic {
  MarvelImage? thumbnail;
  int id;
  String title;
  String? description;
  String? isbn;
  int? pageCount;
  SerieSummary? serieSummary;
  List<Character>? characterList;
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
      this.serieSummary,
      this.characterList,
      this.gallery,
      this.favorited = false,
      this.favoritedCount = 0});
}
