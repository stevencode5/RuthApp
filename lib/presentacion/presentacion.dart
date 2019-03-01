import 'package:flutter/material.dart';
import 'package:ruthapp/presentacion/indicador.dart';
import 'package:ruthapp/presentacion/pantalla-presentacion.dart';

class Presentacion extends StatefulWidget {
  @override
  _PresentacionState createState() => new _PresentacionState();
}

class _PresentacionState extends State<Presentacion> {
  final _controller = new PageController();
  final List<Widget> _listaPantallas = [
    PantallaPresentacion('Hola !', 'Bienvenido a RuthApp',
        'assets/imgs/LogoFlutter.png', Colors.orange, Colors.green, 250, 250),
    PantallaPresentacion('Compra los mejores productos', 'Al mejor tendero...',
        'assets/imgs/LogoFlutter.png', Colors.green, Colors.blue, 250, 250),
    PantallaPresentacion(
        'Vende los mejores productos...',
        'Se tu el mejor tendero!!!',
        'assets/imgs/LogoFlutter.png',
        Colors.blue,
        Colors.purple,
        250,
        250),
  ];
  int pantalla = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool pantallaFinal = pantalla == _listaPantallas.length - 1;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            _creaPantalla(),
            _construirEncabezados(pantallaFinal),
            _construirBase(pantallaFinal),
          ],
        ));
  }

  Positioned _creaPantalla() {
    return Positioned.fill(
      child: PageView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        controller: _controller,
        itemCount: _listaPantallas.length,
        itemBuilder: (BuildContext context, int index) {
          return _listaPantallas[index % _listaPantallas.length];
        },
        onPageChanged: (int p) {
          setState(() {
            pantalla = p;
          });
        },
      ),
    );
  }

  Positioned _construirEncabezados(bool pantallaFinal) {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: SafeArea(
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          primary: false,
          actions: <Widget>[
            _guiaPantalla(pantallaFinal),
          ],
        ),
      ),
    );
  }

  FlatButton _guiaPantalla(bool pantallaFinal) {
    return FlatButton(
      child: Text(
        pantallaFinal ? 'Entendido' : 'Siguiente',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: pantallaFinal
          ? () {
              Navigator.pushReplacementNamed(
                  context, '/administracion/administracion-tienda');
            }
          : () {
              _controller.animateToPage(pantalla + 1,
                  duration: Duration(milliseconds: 300), curve: Curves.easeIn);
            },
    );
  }

  Positioned _construirBase(bool pantallaFinal) {
    return Positioned(
      bottom: 10.0,
      left: 0.0,
      right: 0.0,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            _construirPuntos(),
            _muestraBotonEmpezar(pantallaFinal),
          ],
        ),
      ),
    );
  }

  

  Padding _construirPuntos() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Indicador(
        controlador: _controller,
        numeroItem: _listaPantallas.length,
        pantallaSeleccionada: (int page) {
          _controller.animateToPage(
            page,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
      ),
    );
  }

  Opacity _muestraBotonEmpezar(bool pantallaFinal) {
    return Opacity(
      opacity: pantallaFinal ? 1 : 0,
      child: _botonEmpezar(),
    );
  }

  Container _botonEmpezar() {
    return Container(
        padding: EdgeInsets.only(top: 35),
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          color: Colors.blue,
          child: Text('Empieza',
              style: TextStyle(fontSize: 20.0, color: Colors.white)),
          onPressed: () {
            Navigator.pushReplacementNamed(
                context, '/administracion/administracion-tienda');
          },
        ));
  }
}
