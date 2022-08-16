import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/domain/entities/character.dart';
import 'package:marvel_library/app/modules/home/domain/entities/comic.dart';
import 'package:marvel_library/app/modules/home/domain/entities/creator.dart';
import 'package:marvel_library/app/modules/home/domain/repositories/get_comics_repository.dart';
import 'package:marvel_library/app/modules/home/domain/usecases/get_characters_usecase.dart';
import 'package:marvel_library/app/modules/home/domain/usecases/get_comics_usecase.dart';
import 'package:marvel_library/app/modules/home/domain/usecases/get_creators_usecase.dart';
import 'package:marvel_library/app/modules/home/presenter/home_store.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/small/sections/search_characters_section,.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/small/sections/search_comics_section.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/small/sections/search_creators_section.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;

part 'search_store.g.dart';

class SearchStore = _SearchStoreBase with _$SearchStore;

abstract class _SearchStoreBase with Store {
  final IGetCharactersUsecase getCharactersUsecase;
  final IGetComicsUsecase getComicsUsecase;
  final IGetCreatorsUsecase getCreatorsUsecase;

  _SearchStoreBase(this.getCharactersUsecase, this.getComicsUsecase,
      this.getCreatorsUsecase);

  // Para o onTap do TextField
  @observable
  bool searchTextFieldIsSelected = false;

  @action
  changeSearchTextFieldIsSelected() {
    searchTextFieldIsSelected = !searchTextFieldIsSelected;
  }

  // Para controlar o que está sendo digitado no TextField
  @observable
  TextEditingController searchTextController = TextEditingController();

  // Para a seleção da opção de busca
  @observable
  String selectedFilterOption = "HQs";

  // Lista de seções
  Map<String, Widget> foundSectionList = {
    "HQs": SearchComicsSection(),
    "Personagens": SearchCharactersSection(),
    "Criadores": SearchCreatorsSection()
  };

  // Para saber qual seção acessar
  @observable
  Widget currentSection = SearchComicsSection();

  @action
  setSelectedFilterOption(String value) {
    selectedFilterOption = value;
    currentSection = foundSectionList[value]!;
  }

  // Para decidir qual tipo de busca será feito
  @action
  search() {
    if (selectedFilterOption == "HQs") {
      searchComics();
    } else if (selectedFilterOption == "Personagens") {
      searchCharacters();
    } else {
      searchCreators();
    }
  }

  // Para decidir qual função de searchMore será chamada
  searchMore() {
    changeLoading(withTimer: true);
    if (selectedFilterOption == "HQs") {
      searchMoreComics();
    } else if (selectedFilterOption == "Personagens") {
      searchMoreCharacters();
    } else {
      searchMoreCreators();
    }
    changeLoading();
  }

  /**              --          */

  // Armazena os criadores
  @observable
  var creatorsList = ObservableList<Creator>();

  // Armazena o total de criadores disponíveis pela busca
  @observable
  int totalCreators = 0;

  @observable
  int offsetCreators = 0;

  // Para buscar os criadores
  @action
  searchCreators() {}

  // Para buscar mais criadores (Caso tenha) -> Paginação
  @action
  searchMoreCreators() {}

  /**              --          */

  // Armazena os personagens
  @observable
  var charactersList = ObservableList<Character>();

  // Armazena o total de personagens disponíveis pela busca
  @observable
  int totalCharacters = 0;

  @observable
  int offsetCharacters = 0;

  // Para buscar os personagens
  @action
  searchCharacters() {}

  // Para buscar mais personagens (Caso tenha) -> Paginação
  @action
  searchMoreCharacters() {}

  /**              --          */

  // Armazena as HQs
  @observable
  var comicsList = ObservableList<Comic>();

  // Armazena o total de HQs disponíveis pela busca
  @observable
  int totalComics = 0;

  @observable
  int offsetComics = 0;

  // Para buscar as HQs
  @action
  searchComics() async {
    final result = await getComicsUsecase(ParamsGetComics(
        titleStartsWith: searchTextController.text != ""
            ? searchTextController.text
            : null));
    result.fold((l) => {genericDialog(l.message)}, (r) => {setComics(r)});
  }

  // Para buscar mais HQs (Caso tenha) -> Paginação
  @action
  searchMoreComics() async {
    final result = await getComicsUsecase(ParamsGetComics(
        titleStartsWith:
            searchTextController.text != "" ? searchTextController.text : null,
        offset: offsetComics));
    result.fold((l) => {genericDialog("Erro ao buscar as HQs")},
        (r) => {setComics(r, clear: false)});
  }

  // Função para setar as HQs recebidas (Pode ser utilizada tanto para a função searchMore quando para a search, no caso da searchMore o clear é false)
  setComics(ResponseGetComics response, {bool clear = true}) {
    totalComics = response.total;
    offsetComics = response.offset + 1;

    if (clear) {
      comicsList.clear();
    }
    comicsList.addAll(response.comics);
  }

  // Função que retorna caso o card da hq seja o ultimo da listagem
  bool isTheLastComic(int index) {
    if (index == comicsList.length - 1 && comicsList.length == totalComics) {
      return true;
    }
    return false;
  }

  // Função que retorna caso deva ser exibido o botão de carregar mais
  bool showSearchMoreComicsButton(int index) {
    if (index == comicsList.length - 1 && comicsList.length < totalComics) {
      return true;
    }
    return false;
  }

  // Função que alterna mostrar loading ou não
  changeLoading({bool withTimer = false}) async {
    if (withTimer) {
      await Future.delayed(Duration(seconds: 2));
    }
    Modular.get<HomeStore>().changeLoadingState();
  }

  genericDialog(String message) {
    asuka.showDialog(builder: (context) {
      return AlertDialog(
        title: Text('Aviso'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      );
    });
  }
}
