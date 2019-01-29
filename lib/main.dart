import 'package:flutter/material.dart';
import 'package:ruthapp/pages/login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'RuthApp',
        home: Scaffold(body: Login()));
  }

}
