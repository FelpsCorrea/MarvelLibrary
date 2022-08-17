import 'package:marvel_library/app/modules/home/domain/usecases/get_characters_usecase.dart';
import 'package:marvel_library/app/modules/home/domain/usecases/get_comics_usecase.dart';
import 'package:marvel_library/app/modules/home/domain/usecases/get_creators_usecase.dart';
import 'package:marvel_library/app/modules/home/external/http/http_get_characters.dart';
import 'package:marvel_library/app/modules/home/external/http/http_get_comics.dart';
import 'package:marvel_library/app/modules/home/external/http/http_get_creators.dart';
import 'package:marvel_library/app/modules/home/infra/repositories/get_characters_repository_impl.dart';
import 'package:marvel_library/app/modules/home/infra/repositories/get_comics_repository_impl.dart';
import 'package:marvel_library/app/modules/home/infra/repositories/get_creators_repository_impl.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/search_page.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/search_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SearchModule extends Module {
  @override
  final List<Bind> binds = [
    // Get Comics
    Bind.lazySingleton((i) => HttpGetComics()),
    Bind.lazySingleton((i) => GetComicsRepositoryImpl(i())),
    Bind.lazySingleton((i) => GetComicsUsecase(i())),

    // Get Characters
    Bind.lazySingleton((i) => HttpGetCharacters()),
    Bind.lazySingleton((i) => GetCharactersRepositoryImpl(i())),
    Bind.lazySingleton((i) => GetCharactersUsecase(i())),

    // Get Creators
    Bind.lazySingleton((i) => HttpGetCreators()),
    Bind.lazySingleton((i) => GetCreatorsRepositoryImpl(i())),
    Bind.lazySingleton((i) => GetCreatorsUsecase(i())),

    Bind.lazySingleton((i) => SearchStore(i(), i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: (_, args) =>
            SearchPage(option: args.queryParams['option'] ?? "HQs")),
  ];
}
