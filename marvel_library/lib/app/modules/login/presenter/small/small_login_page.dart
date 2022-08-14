import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/login/presenter/login_store.dart';
import 'package:marvel_library/app/modules/login/presenter/small/widgets/buttons/login_google_button.dart';
import 'package:marvel_library/app/modules/login/presenter/small/widgets/welcome_widget.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';

class SmallLoginPage extends StatefulWidget {
  final String title;
  const SmallLoginPage({Key? key, this.title = 'SmallLoginPage'})
      : super(key: key);
  @override
  SmallLoginPageState createState() => SmallLoginPageState();
}

class SmallLoginPageState extends State<SmallLoginPage>
    with TickerProviderStateMixin {
  final LoginStore store = Modular.get();
  late AnimationController controller;
  late Animation<double> offsetAnimation;
  late Animation<double> offsetBemVindo;
  late Animation<double> opacityAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    Future.delayed(Duration(milliseconds: 1500)).then((value) {
      controller.forward();
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    offsetAnimation =
        Tween<double>(begin: MediaQuery.of(context).size.height * 0.6, end: 0)
            .animate(CurvedAnimation(
                parent: controller,
                curve: Interval(0.0, 1.0, curve: Curves.easeIn)));
    offsetBemVindo =
        Tween<double>(begin: MediaQuery.of(context).size.height * 0.34, end: 0)
            .animate(CurvedAnimation(
                parent: controller,
                curve: Interval(0.0, 1.0, curve: Curves.easeIn)));
    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 1.0, curve: Curves.easeIn)));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: MarvelTheme.burgundy[100],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedBuilder(
                animation: controller,
                builder: (_, __) {
                  return Opacity(
                    opacity: opacityAnimation.value,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.46,
                      color: Colors.white,
                    ),
                  );
                }),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                    animation: controller,
                    builder: (_, __) {
                      return Transform.translate(
                          offset: Offset(0, offsetBemVindo.value),
                          child: WelcomeWidget());
                    }),
                AnimatedBuilder(
                    animation: controller,
                    builder: (_, __) {
                      return Opacity(
                        opacity: opacityAnimation.value,
                        child: Transform.translate(
                          offset: Offset(0, offsetAnimation.value),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 56,
                              ),
                              LoginGoogleButton(),
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
