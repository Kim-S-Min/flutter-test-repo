import 'package:flutter/material.dart';

void main() => runApp(ScaffoldTest());

// =====================================================================

class ScaffoldTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scaffold Test',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MaterialFlutterTest(),
    );
  }
}

class MaterialFlutterTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaterialFlutterTest();
  }
}

class _MaterialFlutterTest extends State<MaterialFlutterTest> {
  String title = '아차차마시고싶다';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$title')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (() {

        }),
      ),
    );
  }
}

// =====================================================================

// 상태를 무시하는 위젯을 상태를 컨트롤 해서 위젯으로 변환하는 함수
class ButtonTest extends StatefulWidget {
  /**
   * !!!Flutter 생명주기
   * 1. createdState() 함수는 상태관리를 생성하는 생명주기로 생명주기 중에서 가장 먼저 실행되는 생명주기 함수이다.
   * 2. mounted == true 는 createdState() 가 호출되어 상태를 생성하면 바로 변경되는 값으로 buildContext 클래스에 접근할 수 있냐 없냐를 판단하는 생명주기이다. 해당 생명주기가 true인 경우에만 setState를 사용할 수 있다.
   * 3. initState() 함수는 override(초기화)할 때 한번만 호출되는 함수이다. JSON DATA와 같이 서버에서 받아온 데이터가 화면에 표시되기 전에 상태를 관리할 수 있다.(여기서 서버의 응답에 따라 화면에 에러화면을 설정할 수 있다.)
   * 4. didChangeDependencies() 함수는 initState() 함수가 호출된 다음 호출되는 생명주기로 데이터에 의존하는 Widget이라면 화면에 표시하기 전에 호출 해야한다.(주로 상속받은 위젯을 사용할 떄 피상속자가 변경되면 호출한다.)
   * 5. build() 함수는 Widget을 반환하는 생명주기이다.(위젯을 화면에 랜더링한다)
   * 6. didUpdateWidget() 함수는 부모의 위젯이나 데이터가 변경되어 위젯을 갱신할 때 호출하는 생명주기이다.(props로 받은 데이터가 변경될 때 등등) 해당 생명주기는 initState()와 달리 화면이 그려진 이후 호출할 수 있다.
   * 7. setState() 함수는 데이터가 변경될 때, 변경된 데이터를 이용해 UI를 변경하는 생명주기이다.(위젯의 상태를 관리하는 생명주기이기도 하다)
   * 8. deactivate() 함수는 위젯의 상태를 중지하는 생명주기이다.(단 State가 제거되었다고 메모리까지 제거되지 않는다.)
   * 9. dispose() 함수는 위젯의 상태관리를 완전히 끝내는 생명주기이다. 그리고 State객체를 영구적으로 소멸할 때 호출한다. 추가적으로 네트워크 통신 중 해당 함수가 호출되면 네트워크 통신 또한 중지된다(cancelToken의 역활을 한다)
   * 10. mounted == false 는 위젯을 화면에서 제거할 때 사용한다. (이때 생명주기가 끝난다.) 이후 생명주기 함수를 호출하면 에러가 발생한다.
   */
  @override
  State<StatefulWidget> createState() {
    return _ButtonTest();
  }
}

class _ButtonTest extends State<ButtonTest> {
  String test = 'hello';
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Button Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // theme에서 splashFactory를 미사용으로 설정해도 material의 기본 물결 임펙트를 제거할 수 없다.
        // splashFactory: NoSplash.splashFactory,
      ),
      darkTheme: ThemeData.light(),
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            child: Text('$test'),
            // ButtonStyle의 style 중 splashFactory를 사용하지 않으면 material의 기본 물결 임펙트를 제거할 수 있다.
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(_color),
              splashFactory: NoSplash.splashFactory,
            ),
            onPressed: () {
              if (test == 'hello') {
                setState(() {
                  test = 'flutter';
                  _color = Colors.amber;
                });
              } else {
                setState(() {
                  test = 'test hello';
                  _color = Colors.black;
                });
              }
            },
          )
        )
      )
    );
  }
}

// =====================================================================

// 상태를 무시하는 위젯을 상태를 컨트롤 해서 위젯으로 변환하는 함수
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

// =====================================================================

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

// =====================================================================

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
