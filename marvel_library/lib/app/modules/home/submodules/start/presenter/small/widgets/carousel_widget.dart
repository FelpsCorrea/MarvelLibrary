import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/submodules/start/presenter/start_store.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';
import 'package:marvel_library/app/themes/opera_theme.dart';

class CarouselWidget extends StatefulWidget {
  final String title;
  const CarouselWidget({Key? key, this.title = 'CarouselWidget'})
      : super(key: key);
  @override
  CarouselWidgetState createState() => CarouselWidgetState();
}

class CarouselWidgetState extends State<CarouselWidget> {
  final StartStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 150,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              store.setCarouselIndex(index);
            },
          ),
          items: store.carouselImageList
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    margin: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                    ),
                    elevation: 6.0,
                    shadowColor: MarvelTheme.neutralLowLight,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(24.0),
                        ),
                        child: Image.asset(
                          item,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        )),
                  ),
                ),
              )
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: store.carouselImageList.map((pathOfItem) {
            int index = store.carouselImageList.indexOf(pathOfItem);
            return Observer(builder: (_) {
              return Container(
                width: 10.0,
                height: 10.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: store.carouselIndex == index
                      ? MarvelTheme.white
                      : OperaTheme.mediumPurple,
                ),
              );
            });
          }).toList(),
        )
      ],
    );
  }
}
