import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marvel_library/app/constants/config_constants.dart';
import 'package:marvel_library/app/constants/http_constants.dart';
import 'package:marvel_library/app/modules/home/domain/errors/errors.dart';
import 'package:marvel_library/app/modules/home/domain/repositories/get_characters_repository.dart';
import 'package:marvel_library/app/modules/home/external/http/mappers/get_characters_mapper.dart';
import 'package:marvel_library/app/modules/home/infra/datasources/get_characters_datasource.dart';

class HttpGetCharacters implements GetCharactersDatasource {
  @override
  Future<ResponseGetCharacters> getCharacters(
      ParamsGetCharacters params) async {
    try {
      String startUrl = "${ConfigConstants.hostnameMarvel}/characters";

      if (params.characterId != null) {
        startUrl += "/${params.characterId}";
      }

      String url =
          '$startUrl?apikey=${ConfigConstants.APIKey}&hash=${ConfigConstants.APIHash}&ts=${ConfigConstants.ts}&limit=${params.limit}&offset=${params.offset}';

      if (params.comics != null) {
        String comicsList = "";
        for (var id in params.comics!) {
          comicsList += id.toString();
          if (params.comics!.indexOf(id) < params.comics!.length - 1) {
            comicsList += ",";
          }
        }
        url += "&comics=$comicsList";
      }
      if (params.name != null) {
        url += "&name=${params.name}";
      }
      if (params.nameStartsWith != null) {
        url += "&nameStartsWith=${params.nameStartsWith}";
      }
      if (params.orderBy != null) {
        url += "&orderBy=${params.orderBy}";
      }

      var response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json'
      }).timeout(Duration(seconds: 60));
      if (response.statusCode == HttpConstants.REQUEST_SUCCESS) {
        return GetCharactersMapper.getResponseFromMap(
            jsonDecode(response.body)["data"]);
      } else {
        throw GetCharactersException(jsonDecode(response.body)["message"]);
      }
    } catch (e) {
      throw GetCharactersException(e.toString());
    }
  }
}
