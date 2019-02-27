import 'package:flutter/material.dart';
//import 'package:ruthapp/presentacion/efectos.dart';


class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: double.infinity,
      width: double.infinity,
      decoration: new BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.grey[300],
            Colors.deepPurple[900],
          ],
          begin: Alignment(0.5, -1.0),
          end: Alignment(0.5, 1.0)
        )
      ),
      child: Stack(
        children: <Widget>[
          /*new Positioned(
            child: new CircleWithImage('assets/imgs/LogoFlutter.png'),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),*/
          new Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  child: Image(
                    image: AssetImage('assets/imgs/LogoFlutter.png'),
                    fit: BoxFit.fitHeight,
                  ),
                  height: 250.0,
                  width: 250.0,
                ),
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Compra los mejores productos',
                    style: Theme.of(context).textTheme.display2.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text('Al mejor tendero...',
                  style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white),
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