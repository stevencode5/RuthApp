import 'package:flutter/material.dart';

class PantallaPresentacion extends StatelessWidget {
  final String _textoPrincipal;
  final String _textoSecundario;
  final String _urlImagen;
  final Color _colorPrincipal;
  final Color _colorSecundario;
  final double _dimensionImgAncho;
  final double _dimensionImgAlto;

  PantallaPresentacion(
      @required this._textoPrincipal,
      @required this._textoSecundario,
      @required this._urlImagen,
      @required this._colorPrincipal,
      @required this._colorSecundario,
      @required this._dimensionImgAlto,
      @required this._dimensionImgAncho);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        _colorPrincipal,
        _colorSecundario,
      ], begin: Alignment.bottomLeft, end: Alignment.bottomRight)),
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
        height: _dimensionImgAlto,
        width: _dimensionImgAncho,
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
