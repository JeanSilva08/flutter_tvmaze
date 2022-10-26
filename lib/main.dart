import 'package:flutter/material.dart';
import 'package:flutter_tvmaze/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey, fontFamily: 'FontsFree-Net-Segoe-UI'),
      home: const Home(),
    );
  }
}
