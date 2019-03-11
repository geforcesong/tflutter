import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import './CounterModel.dart';
import 'CounterHome.dart';

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return ScopedModel<CounterModel>(
      model: CounterModel(),
      child: MaterialApp(
        title: 'Flutter Scope Demo',
        home: CounterHome('Scoped Model Demo')
      ),
    );
  }
}