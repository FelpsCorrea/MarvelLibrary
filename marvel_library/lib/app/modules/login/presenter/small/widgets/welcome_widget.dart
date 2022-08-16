import 'package:flutter/material.dart';

class WelcomeWidget extends StatefulWidget {
  final String title;
  const WelcomeWidget({Key? key, this.title = 'WelcomeWidget'})
      : super(key: key);
  @override
  WelcomeWidgetState createState() => WelcomeWidgetState();
}

class WelcomeWidgetState extends State<WelcomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/marvel_logo_legenda.png', scale: 2.5);
  }
}
