import 'package:flutter/material.dart';
import 'package:flutter_application/screens/welcome_screen.dart';
import 'package:flutter_application/size_config.dart';

class Splash extends StatefulWidget {
  static const String routeName = '/splash';
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  dynamic navigatorToHome() async {
    await Future.delayed(Duration(seconds: 1));
    return Navigator.pushReplacementNamed(context, WelcomeScreen.routeName);
  }

  @override
  void initState() {
    navigatorToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      color: Colors.black,
    );
  }
}
