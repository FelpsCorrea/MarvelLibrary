import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';

class TutorialWidget extends StatefulWidget {
  final String title;
  const TutorialWidget({Key? key, this.title = 'TutorialWidget'})
      : super(key: key);
  @override
  TutorialWidgetState createState() => TutorialWidgetState();
}

class TutorialWidgetState extends State<TutorialWidget> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MarvelTheme.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/robo_quebrado.png', scale: 5),
              Text(
                "Tamanho de tela não compatível, então segue o tutorialzinho :) - (O foco não é essa tela hahaha)",
                style: GoogleFonts.inter(
                    color: MarvelTheme.neutralLowDark,
                    fontWeight: FontWeight.w600,
                    fontSize: 24),
              ),
              SizedBox(height: 40),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    currentPage > 1
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                currentPage -= 1;
                              });
                            },
                            icon: Icon(FeatherIcons.arrowLeft, size: 40))
                        : Container(),
                    SizedBox(width: 24),
                    getCurrentPage(),
                    SizedBox(width: 24),
                    currentPage < 4
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                currentPage += 1;
                              });
                            },
                            icon: Icon(FeatherIcons.arrowRight, size: 40))
                        : Container()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getCurrentPage() {
    if (currentPage == 1) {
      return tutorial1();
    } else if (currentPage == 2) {
      return tutorial2();
    } else if (currentPage == 3) {
      return tutorial3();
    }
    return tutorial4();
  }

  Widget tutorial1() {
    return Column(
      children: [
        Image.asset('assets/images/tutorial_1.png'),
        SizedBox(height: 16),
        Text(
          "Clique com o botão direito em qualquer lugar da tela e selecione a opção marcada",
          style: GoogleFonts.inter(
              color: MarvelTheme.neutralLowDark,
              fontWeight: FontWeight.w600,
              fontSize: 16),
        ),
        SizedBox(height: 40)
      ],
    );
  }

  Widget tutorial2() {
    return Column(
      children: [
        Image.asset('assets/images/tutorial_2.png', scale: 2),
        SizedBox(height: 16),
        Text(
          "Clique no ícone circulado (Em todo navegador será algo parecido)",
          style: GoogleFonts.inter(
              color: MarvelTheme.neutralLowDark,
              fontWeight: FontWeight.w600,
              fontSize: 16),
        ),
        SizedBox(height: 40)
      ],
    );
  }

  Widget tutorial3() {
    return Column(
      children: [
        Image.asset('assets/images/tutorial_3.png', scale: 1.5),
        SizedBox(height: 16),
        Text(
          "Clique no dropdown circulado para exibir as opções de dispositivos",
          style: GoogleFonts.inter(
              color: MarvelTheme.neutralLowDark,
              fontWeight: FontWeight.w600,
              fontSize: 16),
        ),
        SizedBox(height: 40)
      ],
    );
  }

  Widget tutorial4() {
    return Column(
      children: [
        Image.asset('assets/images/tutorial_4.png'),
        SizedBox(height: 16),
        Text(
          "Selecione o dispositivo desejado para simular e Voilà! :)",
          style: GoogleFonts.inter(
              color: MarvelTheme.neutralLowDark,
              fontWeight: FontWeight.w600,
              fontSize: 16),
        ),
        SizedBox(height: 40)
      ],
    );
  }
}
