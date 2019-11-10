import 'package:flutter/material.dart';
import 'package:flutter_alilo/screens/home_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Ui chat App',
      theme: ThemeData(
       primaryColor:Colors.red ,
        primarySwatch: Colors.red,
      ),
      home: HomeScreen(title: 'Home Page'),
    );
  }
}

