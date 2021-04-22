import 'package:flutter/material.dart';
import 'package:vecsympo/home.dart';
import 'package:vecsympo/bloc/login.dart';
import 'package:vecsympo/bloc/register.dart';
import 'package:vecsympo/bloc/splash.dart';
import 'package:vecsympo/bloc/event.dart';

void main(){

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SplashPage(),
        routes: <String, WidgetBuilder>{
          // '/event': (BuildContext context) => EventPage(title: 'Event'),
          '/home': (BuildContext context) => Home(title: 'Home'),
          '/login': (BuildContext context) => LoginPage(),
          '/register': (BuildContext context) => RegisterPage(),
        }
    );
  }
}
