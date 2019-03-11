import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'models/MPageModel.dart';
import 'SearchPage.dart';

class MApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return ScopedModel<MPageModel>(
      model: MPageModel(),
      child: MaterialApp(
        title: 'Flutter Scope Demo',
        home: SearchPage('This is search page')
      ),
    );
  }
}