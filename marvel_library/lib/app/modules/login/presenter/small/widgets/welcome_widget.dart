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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Image.asset('assets/images/marvel_logo.png', scale: 2)],
    );
  }
}
