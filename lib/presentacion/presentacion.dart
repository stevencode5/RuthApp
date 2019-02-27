import 'package:flutter/material.dart';
import 'package:ruthapp/presentacion/paginas/pagina1.dart';
import 'package:ruthapp/presentacion/paginas/pagina2.dart';
import 'package:ruthapp/presentacion/paginas/pagina3.dart';
import 'package:ruthapp/presentacion/indicador.dart';

class Presentacion extends StatefulWidget {
  @override
  _PresentacionState createState() => new _PresentacionState();
}

class _PresentacionState extends State<Presentacion> {
  final _controller = new PageController();
  final List<Widget> _pages = [
    Page1(),
    Page2(),
    Page3(),
  ];
  int page = 0;
  Container _Empezar() {
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDone = page == _pages.length - 1;
    return new Scaffold(
        backgroundColor: Colors.transparent,
        body: new Stack(
          children: <Widget>[
            new Positioned.fill(
              child: new PageView.builder(
                physics: new AlwaysScrollableScrollPhysics(),
                controller: _controller,
                itemCount: _pages.length,
                itemBuilder: (BuildContext context, int index) {
                  return _pages[index % _pages.length];
                },
                onPageChanged: (int p) {
                  setState(() {
                    page = p;
                  });
                },
              ),
            ),
            new Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: new SafeArea(
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  primary: false,
                  actions: <Widget>[
                    FlatButton(
                      child: Text(
                        isDone ? 'Entendido' : 'Siguiente',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: isDone
                          ? () {
                              Navigator.pushReplacementNamed(context,
                                  '/administracion/administracion-tienda');
                            }
                          : () {
                              _controller.animateToPage(page + 1,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            },
                    )
                  ],
                ),
              ),
            ),
            new Positioned(
              bottom: 10.0,
              left: 0.0,
              right: 0.0,
              child: new SafeArea(
                child: new Column(
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new DotsIndicator(
                        controller: _controller,
                        itemCount: _pages.length,
                        onPageSelected: (int page) {
                          _controller.animateToPage(
                            page,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                      ),
                    ),
                    new Opacity(
                      opacity: isDone ? 1 : 0,
                      child: _Empezar(),
                      /*child: Container(
                        width: 150.0,
                        height: 50.0,
                        child: new Material(
                          child: MaterialButton(
                            child: Text(
                              'Empieza',
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  .copyWith(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.pushReplacementNamed(context,
                                  '/administracion/administracion-tienda');
                            },
                            //highlightColor: Colors.orange.withOpacity(0.5),
                            //splashColor: Colors.orange.withOpacity(0.5),
                          ),
                          color: Colors.transparent,
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),*/
                    ),
                    /*Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Container(
                        width: 150.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          gradient: new LinearGradient(
                            colors: [
                              Colors.orange[600],
                              Colors.orange[900],
                            ],
                            begin: Alignment(0.5, -1.0),
                            end: Alignment(0.5, 1.0)
                          ),
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        child: new Material(
                          child: MaterialButton(
                            child: Text('Registro',
                              style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),
                            ),
                            onPressed: (){},
                            highlightColor: Colors.orange.withOpacity(0.5),
                            splashColor: Colors.orange.withOpacity(0.5),
                          ),
                          color: Colors.transparent,
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                      new Container(
                        width: 150.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.circular(30.0),
                          border: Border.all(color: Colors.white, width: 1.0),
                          color: Colors.transparent,
                        ),
                        child: new Material(
                          child: MaterialButton(
                            child: Text('LOG IN',
                              style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),
                            ),
                            onPressed: (){},
                            highlightColor: Colors.white30,
                            splashColor: Colors.white30,
                          ),
                          color: Colors.transparent,
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                    ],
                  ),*/
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
