import 'package:flutter/material.dart';
import 'avartarpage.dart';
class RoboMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),
        home: AvatarPage(),
    );
  }
}