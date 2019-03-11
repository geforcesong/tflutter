import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'CounterModel.dart';

class CounterHome extends StatelessWidget {
  final String title;
  CounterHome(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(this.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildCounterText()
          ],
        ),
      ),
      floatingActionButton: buildIncrementFab(),
    );
  }
}

var conterText = (int counter) =>
    "You have incremented the counter ${counter.toString()} times";

var buildCounterText = () => ScopedModelDescendant<CounterModel>(
    builder: (context, child, model) => Text(conterText(model.counter),
        style: Theme.of(context).textTheme.body2));

var buildIncrementFab = () => ScopedModelDescendant<CounterModel>(
    builder: (context, child, model) => FloatingActionButton(
          onPressed: model.increment,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ));
