import 'package:flutter/material.dart';
import 'package:tflutter/screens/auth_provider.dart';
import 'home.dart';
import 'about.dart';
import 'todolist/TodosScreen.dart';
import 'todolist/Todo.dart';
import 'shopper/screens/LoginScreen.dart';
import 'package:scoped_model/scoped_model.dart';
import 'shopper/models/CartModel.dart';
import 'shopper/screens/Catalog.dart';
import 'shopper/screens/Cart.dart';
import 'scopem/CounterApp.dart';
import 'mpage/mapp.dart';
import 'screens/login_page.dart';
import 'bottombar/mainpage.dart';
import 'screens/auth.dart';
import 'screens/login_home.dart';
import 'robohash/roboMain.dart';
import 'notes/notelist.dart';

void main() {
  final cart = CartModel();
  runApp(ScopedModel<CartModel>(
    model: cart,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Layout Demo',
        // home: Scaffold(
        //   appBar: AppBar(title: Text('Flutter layout demo')),
        //   body: HomeWidget()
        // ),
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          textTheme: TextTheme(
            display4: TextStyle(
              fontFamily: 'Corben',
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/home': (context) => HomeWidget(),
          '/todos': (context) => TodosScreen(
                todos: List.generate(
                    20,
                    (i) => Todo('Todo $i',
                        'A description of what needs to be done for Todo $i')),
              ),
          '/': (context) => AboutRoute(),
          '/login': (context) => LoginScreen(),
          '/catalog': (context) => MyCatalog(),
          '/counterapp': (context) => CounterApp(),
          '/mapp': (context) => MApp(),
          '/cart': (context) => MyCart(),
          '/logindemo': (context) => AuthProvider(child: LoginPage(), auth: Auth()),
          '/loginhome': (context) => LoginHome(),
          '/bottombar': (context) => MainPage(),
          '/robohash': (context) => RoboMain(),
          '/notes': (context) => NoteList()
        });
  }
}
