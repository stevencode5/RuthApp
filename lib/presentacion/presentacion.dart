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
  Container _empezar() {
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
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Positioned.fill(
              child: PageView.builder(
                physics: AlwaysScrollableScrollPhysics(),
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
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: SafeArea(
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
            Positioned(
              bottom: 10.0,
              left: 0.0,
              right: 0.0,
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DotsIndicator(
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
                    Opacity(
                      opacity: isDone ? 1 : 0,
                      child: _empezar(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
