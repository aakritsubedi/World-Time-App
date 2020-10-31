import 'package:flutter/material.dart';

import 'package:WorldClock/pages/loading.dart';
import 'package:WorldClock/pages/home.dart';
import 'package:WorldClock/pages/chooseLocation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World Clock App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => Loading(), 
        '/home': (context) =>  MyHomePage(title: 'World Clock Application'),
        '/location': (context) => ChooseLocation()
      },
    );
  }
}