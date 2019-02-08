import 'package:flutter/material.dart';

class HomeInicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              _crearTextoIntroduccion(),
              _crearPanelNuevaTienda(context),
              _crearPanelSuscribirseTienda(context)
            ],
          )
        )        
      )
    );
  }

  Container _crearTextoIntroduccion(){
    return Container(
      padding: EdgeInsets.only(top: 35, bottom: 25),
      child: Text('Puedes comenzar por alguna de estas opciones :')        
    );      
  }

  Container _crearPanelNuevaTienda(BuildContext context){
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Text('Si deseas crear Nueva Tienda :'),
          RaisedButton(
            textColor: Colors.white,
            color: Colors.blue,
            child: Text('Nueva tienda'),
            onPressed: (){
              Navigator.of(context).pushNamed('/administracion/tienda/crear-tienda');
            },
          )
        ],
      ),
    );
  }

  Container _crearPanelSuscribirseTienda(BuildContext context){
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Text('Si deseas suscribirte a una Tienda ya existente :'),
          RaisedButton(
            textColor: Colors.white,
            color: Colors.blue,
            child: Text('Suscribirse a tienda'),
            onPressed: (){
              Navigator.of(context).pushNamed('/cliente/suscribirse-tienda');
            },
          )
        ],
      ),
    );
  }

}
