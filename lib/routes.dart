import 'package:flutter/material.dart';
import 'package:flutter_application/screens/reminder_screen.dart';
import 'package:flutter_application/screens/splash_screen.dart';
import 'package:flutter_application/screens/timer_screen.dart';
import 'package:flutter_application/screens/welcome_screen.dart';

final Map<String, WidgetBuilder> routes = {
  Splash.routeName: (context) => Splash(),
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  ReminderScreen.routeName: (context) => ReminderScreen(),
  TimerScreen.routeName: (context) => TimerScreen(),
};
