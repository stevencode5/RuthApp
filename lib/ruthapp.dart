import 'package:flutter/material.dart';
import 'package:ruthapp/menu-principal.dart';

class RuthApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RuthAppState();
  }
}

class _RuthAppState extends State<RuthApp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'RuthApp !',
          style: TextStyle(fontSize: 30),
        ),
      ),
      drawer: MenuPrincipal(),
      body: Container(
          child: Center(
              child: Column(

        children: <Widget>[
          Text('Buenas!'),
          Container(
            padding: EdgeInsets.all(20),
            child: RaisedButton(
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pushNamed('/productos/consulta-producto');                  
                },
                child: Text('Productos')),
          )
        ],
      ))),
    );
  }
}
