import 'package:flutter/material.dart';
import 'home.dart';
import 'about.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Layout Demo',
        // home: Scaffold(
        //   appBar: AppBar(title: Text('Flutter layout demo')),
        //   body: HomeWidget()
        // ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeWidget(),
          '/about': (context) => AboutRoute()
        });
  }
}
