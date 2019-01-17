import 'package:flutter/material.dart';

class StlPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina sin estado"),
      ),
      body: Container(
        child: Center(
          child: Text("Esto es un texto !"),
          )
      ),
    );
  }
}
