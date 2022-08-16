import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marvel_library/app/constants/config_constants.dart';
import 'package:marvel_library/app/constants/http_constants.dart';
import 'package:marvel_library/app/modules/home/domain/errors/errors.dart';
import 'package:marvel_library/app/modules/home/domain/repositories/get_creators_repository.dart';
import 'package:marvel_library/app/modules/home/external/http/mappers/get_creators_mapper.dart';
import 'package:marvel_library/app/modules/home/infra/datasources/get_creators_datasource.dart';

class HttpGetCreators implements GetCreatorsDatasource {
  @override
  Future<ResponseGetCreators> getCreators(ParamsGetCreators params) async {
    try {
      String url =
          '${ConfigConstants.hostnameMarvel}/creators?apikey=${ConfigConstants.APIKey}&hash=${ConfigConstants.APIHash}&ts=${ConfigConstants.ts}&limit=${params.limit}&offset=${params.offset}';
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
        return GetCreatorsMapper.getResponseFromMap(
            jsonDecode(response.body)["data"]);
      } else {
        throw GetCreatorsException(jsonDecode(response.body)["message"]);
      }
    } catch (e) {
      throw GetCreatorsException(e.toString());
    }
  }
}
