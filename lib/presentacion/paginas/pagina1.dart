import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.blue[400],
        Colors.white,
      ], begin: Alignment(0.5, -1.0), end: Alignment(0.5, 1.0))),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Hola!!!',
                    style: Theme.of(context)
                        .textTheme
                        .display3
                        .copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  child: Image(
                    image: AssetImage('assets/imgs/LogoFlutter.png'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Text(
                  'Bienvenido a RuthApp',
                  style: Theme.of(context)
                      .textTheme
                      .display2
                      .copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
        ],
        alignment: FractionalOffset.center,
      ),
    );
  }
}
