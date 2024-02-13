import 'package:flutter/material.dart';
import 'package:flutterprojects/shared/bottom_navigation_bar.dart';
import 'package:flutterprojects/shared/menu_drawer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:  Text('Menú')),
        drawer:  MenuDrawer(),
        bottomNavigationBar:  MyBottonNavigationBar(),
        body: Container(decoration:  BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background_flutter.jpg'),fit: BoxFit.cover,alignment: Alignment.centerLeft)
        ),
            child: Center(child: Image.asset('assets/logo.png', scale: 20)
            )
        )
    );
  }
}
