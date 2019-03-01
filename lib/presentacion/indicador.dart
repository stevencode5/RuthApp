import 'dart:math';
import 'package:flutter/material.dart';

class Indicador extends AnimatedWidget {
  Indicador({
    this.controlador,
    this.numeroItem,
    this.pantallaSeleccionada,
    this.color: Colors.white,
  }) : super(listenable: controlador);

  final PageController controlador;
  final int numeroItem;
  final ValueChanged<int> pantallaSeleccionada;
  final Color color;
  static const double _puntosGrosorBase = 8.0;
  static const double _puntosGrosorMaximo = 2.0;
  static const double _espacioEntrePuntos = 25.0;

  Widget _construirPuntos(int indice) {
    double animacionPuntos = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controlador.page ?? controlador.initialPage) - indice).abs(),
      ),
    );
    double zoom = 1.0 + (_puntosGrosorMaximo - 1.0) * animacionPuntos;
    return _creaPuntos(zoom, indice);
  }

  
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(numeroItem, _construirPuntos),
    );
  }

  Container _creaPuntos(double zoom,int indice) {
    return Container(
      width: _espacioEntrePuntos,
      child: Center(
        child: Material(
          color: color,
          type: MaterialType.circle,
          child: Container(
            width: _puntosGrosorBase * zoom,
            height: _puntosGrosorBase * zoom,
            child: InkWell(
              onTap: () => pantallaSeleccionada(indice),
            ),
          ),
        ),
      ),
    );
  }

}
