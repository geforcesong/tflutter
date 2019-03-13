import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'models/MPageModel.dart';
import 'SearchPage.dart';

class MApp extends StatefulWidget {
  @override
  MAppState createState() => new MAppState();
}

class MAppState extends State<MApp> {
  MPageModel _model = new MPageModel();

  @override
  void initState() {
    super.initState();
    _model.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MPageModel>(
      model: _model,
      child: MaterialApp(
        title: 'Flutter Scope Demo',
        home: SearchPage('Search page')
      )
    );
  }
}