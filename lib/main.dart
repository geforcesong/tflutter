import 'package:flutter/material.dart';
import 'home.dart';
import 'about.dart';
import 'todolist/TodosScreen.dart';
import 'todolist/Todo.dart';
import 'shopper/screens/LoginScreen.dart';
import 'package:scoped_model/scoped_model.dart';
import 'shopper/models/CartModel.dart';
import 'shopper/screens/Catalog.dart';
import 'shopper/screens/Cart.dart';

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
          '/': (context) => HomeWidget(),
          '/todos': (context) => TodosScreen(
                todos: List.generate(
                    20,
                    (i) => Todo('Todo $i',
                        'A description of what needs to be done for Todo $i')),
              ),
          '/about': (context) => AboutRoute(),
          '/login': (context) => LoginScreen(),
          '/catalog': (context) => MyCatalog(),
        '/cart': (context) => MyCart()
        });
  }
}
