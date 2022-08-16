import 'package:marvel_library/app/modules/home/domain/repositories/get_creators_repository.dart';

abstract class GetCreatorsDatasource {
  Future<ResponseGetCreators> getCreators(ParamsGetCreators params);
}