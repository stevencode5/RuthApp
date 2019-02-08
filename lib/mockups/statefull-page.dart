import 'package:flutter/material.dart';

class StfPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StfPageState();
  }
}

class _StfPageState extends State<StfPage> {
  void espichar() {
    print('Oprimio el boton !!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pagina con Estado'),
        ),
        body: Container(
          child: Center(
            child: RaisedButton(
              padding: EdgeInsets.all(15.10),
              onPressed: espichar,
              child: Text('Oprima !'),
            ),
          )
        )
    );
  }
}
