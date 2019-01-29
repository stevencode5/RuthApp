import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ruthapp/pages/productos/consulta-productos.dart';

class RuthApp extends StatefulWidget {

  final FirebaseUser usuario;

  RuthApp(@required this.usuario);

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
      body: Container(
          child: Center(
              child: Column(

        children: <Widget>[
          Text("Usuario Logeado ${widget.usuario.email} !"),
          Container(
            padding: EdgeInsets.all(20),
            child: RaisedButton(
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ConsultaProductos()),
                  );
                },
                child: new Text('Productos')),
          )
        ],
      ))),
    );
  }
}
