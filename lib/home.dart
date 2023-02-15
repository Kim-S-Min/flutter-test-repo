import 'package:flutter/material.dart';
import 'package:new_flutter_project/image.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'I want leave work',
                style: TextStyle(fontFamily: 'Tourney', fontSize: 40, color: Colors.red),
              ),
              ImageComponent()
            ],
          ),

        )
      )
    );
  }
}
