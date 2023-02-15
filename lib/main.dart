import 'package:flutter/material.dart';

void main() {
  runApp(__SwitchReloadPage());
}

class __SwitchReloadPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SwitchReloadPage();
  }
}

// 상태 변경이 되지 않는 위젯
class _SwitchReloadPage extends State<__SwitchReloadPage> {
  @override
  Widget build(BuildContext context) {
    var switchValue = false;

    return MaterialApp(
        title: 'Flutter Switch Reload Page Test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData.light(),
        home: Scaffold(
          body: Center(
              child: Switch(
                value: switchValue,
                onChanged: (value) {
                  setState(() {
                    switchValue = value;
                  });
                })),
        ));
  }
}

// 상태 변경이 되지 않는 위젯
class SwitchReloadPage extends StatelessWidget {
  const SwitchReloadPage({super.key});

  // const SwitchReloadPage({super.key})

  @override
  Widget build(BuildContext context) {
    var switchValue = false;

    return MaterialApp(
        title: 'Flutter Switch Reload Page Test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData.light(),
        home: Scaffold(
          body: Center(
              child: Switch(
            value: switchValue,
            onChanged: (value) {
              switchValue = value;
            },
          )),
        ));
  }
}

// Hello World
class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Container(
            color: Colors.white,
            child: Center(
                child: Text('hello\nworld',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 50)))));
  }
}
