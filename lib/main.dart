import 'package:flutter/material.dart';
import 'package:loginjitsin/Widgets/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jitsi Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        secondaryHeaderColor: Colors.green ,
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}


