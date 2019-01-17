import 'package:flutter/material.dart';
import 'package:ruthapp/pages/mockups/statefull-page.dart';

class RuthApp extends StatefulWidget {
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
        title: Text("RuthApp !"),
      ),
      body: Container(
          child: Center(
              child: Column(
        children: <Widget>[
          Text("RuthApp !",
              style: TextStyle(
              fontSize: 30,
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold)),
          RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StfPage()),
                );
              },
              child: new Text("Go")),
        ],
      ))),
    );
  }
}
