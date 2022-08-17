import 'dart:convert';

import 'package:marvel_library/app/constants/config_constants.dart';
import 'package:marvel_library/app/constants/http_constants.dart';
import 'package:marvel_library/app/modules/home/domain/errors/errors.dart';
import 'package:marvel_library/app/modules/home/domain/repositories/get_comics_repository.dart';
import 'package:marvel_library/app/modules/home/external/http/mappers/get_comics_mapper.dart';
import 'package:marvel_library/app/modules/home/infra/datasources/get_comics_datasource.dart';
import 'package:http/http.dart' as http;

class HttpGetComics implements GetComicsDatasource {
  @override
  Future<ResponseGetComics> getComics(ParamsGetComics params) async {
    try {
      String startUrl = "${ConfigConstants.hostnameMarvel}/comics";

      if (params.comicId != null) {
        startUrl += "/${params.comicId}";
      }

      String url =
          '$startUrl?apikey=${ConfigConstants.APIKey}&hash=${ConfigConstants.APIHash}&ts=${ConfigConstants.ts}&limit=${params.limit}&offset=${params.offset}';
      if (params.characters != null) {
        String charactersList = "";
        for (var id in params.characters!) {
          charactersList += id.toString();
          if (params.characters!.indexOf(id) < params.characters!.length - 1) {
            charactersList += ",";
          }
        }
        url += "&characters=$charactersList";
      }
      if (params.creators != null) {
        String creatorsList = "";
        for (var id in params.creators!) {
          creatorsList += id.toString();
          if (params.creators!.indexOf(id) < params.creators!.length - 1) {
            creatorsList += ",";
          }
        }
        url += "&creators=$creatorsList";
      }
      if (params.title != null) {
        url += "&title=${params.title}";
      }
      if (params.titleStartsWith != null) {
        url += "&titleStartsWith=${params.titleStartsWith}";
      }
      if (params.orderBy != null) {
        url += "&orderBy=${params.orderBy}";
      }

      print(url);

      var response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json'
      }).timeout(Duration(seconds: 60));
      if (response.statusCode == HttpConstants.REQUEST_SUCCESS) {
        return GetComicsMapper.getResponseFromMap(
            jsonDecode(response.body)["data"]);
      } else {
        throw GetComicsException(jsonDecode(response.body)["message"]);
      }
    } catch (e) {
      throw GetComicsException(e.toString());
    }
  }
}
