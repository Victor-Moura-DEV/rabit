import 'package:flutter/material.dart';
import 'package:flutter_application/routes.dart';
import 'package:flutter_application/screens/splash_screen.dart';
import 'package:flutter_application/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      initialRoute: Splash.routeName,
      debugShowCheckedModeBanner: false,
      title: 'Desafio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}
