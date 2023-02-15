import 'package:flutter/material.dart';

class ImageWidgetApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _imageWidgetApp();
  }
}

class _imageWidgetApp extends State<ImageWidgetApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: Container(
        color: Colors.brown,
        child: Center(
          child: Column(
            children: <Widget>[
              Text('hello'),
              Image.asset('images/unm.png'),
            ],
          )
        )
      )
    );
  }
}