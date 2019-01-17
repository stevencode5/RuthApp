import 'package:flutter/material.dart';
import 'package:ruthapp/ruthapp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'RuthApp',
        home: Scaffold(body: RuthApp()));
  }

}
