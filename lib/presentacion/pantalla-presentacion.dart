import 'package:flutter/material.dart';

class PantallaPresentacion extends StatelessWidget {
  final String _textoPrincipal;
  final String _textoSecundario;
  final String _urlImagen;

  PantallaPresentacion(@required this._textoPrincipal, @required this._textoSecundario, @required this._urlImagen);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.grey[300],
        Colors.deepPurple[900],
      ], begin: Alignment(0.5, -1.0), end: Alignment(0.5, 1.0))),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _crearImagenPresentacion(),
                _crearTextoPrincipal(context),
                _crearTextoSecundario(context)
              ],
            ),
          )
        ],
        alignment: FractionalOffset.center,
      ),
    );
  }

  SizedBox _crearImagenPresentacion() {
    return SizedBox(
      child: Image(
        image: AssetImage(this._urlImagen),
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Padding _crearTextoPrincipal(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        this._textoPrincipal,
        style:
            Theme.of(context).textTheme.display2.copyWith(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }

  Text _crearTextoSecundario(BuildContext context) {
    return Text(
      this._textoSecundario,
      style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white),
      textAlign: TextAlign.center,
    );
  }
}
