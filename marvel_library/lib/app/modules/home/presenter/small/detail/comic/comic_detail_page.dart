import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_library/app/modules/home/presenter/home_store.dart';
import 'package:marvel_library/app/modules/home/presenter/small/detail/comic/sections/comic_characters_section.dart';
import 'package:marvel_library/app/modules/home/presenter/small/detail/comic/sections/comic_gallery_section.dart';
import 'package:marvel_library/app/modules/home/presenter/small/detail/comic/sections/comic_info_section.dart';
import 'package:marvel_library/app/modules/home/presenter/small/detail/comic/widgets/comic_detail_description.dart';
import 'package:marvel_library/app/modules/home/presenter/small/detail/comic/widgets/comic_detail_thumb.dart';
import 'package:marvel_library/app/modules/home/presenter/small/detail/comic/widgets/comic_detail_title_widget.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';

class SmallComicDetailPage extends StatefulWidget {
  const SmallComicDetailPage({Key? key}) : super(key: key);

  @override
  SmallComicDetailPageState createState() => SmallComicDetailPageState();
}

class SmallComicDetailPageState extends State<SmallComicDetailPage> {
  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return store.currentComic != null
          ? Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  MarvelTheme.highDarkGray,
                  MarvelTheme.hyperDarkGray,
                ],
              )),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: IconButton(
                                    onPressed: () {
                                      store.changeShowBottomNav();
                                    },
                                    icon: const Icon(FeatherIcons.arrowLeft,
                                        color: MarvelTheme.white, size: 32)),
                              ),
                              const SizedBox(height: 24),
                              ComicDetailTitleWidget(
                                  title: store.currentComic!.title),
                              const SizedBox(height: 16),
                              Text(
                                store.currentComic!.serie != null
                                    ? store.currentComic!.serie!.name
                                    : "-",
                                style: GoogleFonts.pompiere(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: MarvelTheme.neutralHighDarker),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ComicDetailThumbWidget(
                                    thumbPath:
                                        "${store.currentComic!.thumbnail!.path}.${store.currentComic!.thumbnail!.extension}"),
                                SizedBox(width: 8),
                                Expanded(
                                  child: ComicDetailDescriptionWidget(
                                      description:
                                          store.currentComic!.description !=
                                                  null
                                              ? store.currentComic!.description!
                                              : "Sem descrição"),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    ComicInfoSectionWidget(),
                    SizedBox(height: 16),
                    ComicCharactersSectionWidget(),
                    Observer(builder: (_) {
                      return store.currentComic!.gallery != null &&
                              store.currentComic!.gallery!.isNotEmpty
                          ? Column(
                              children: [
                                SizedBox(height: 16),
                                ComicGallerySectionWidget(),
                              ],
                            )
                          : Container();
                    }),
                    SizedBox(height: 50)
                  ],
                ),
              ))
          : Container();
    });
  }
}
