import 'package:flutter/material.dart';
import 'models/Property.dart';

class ListingItem extends StatelessWidget {
  final Property _model;
  final int _index;

  ListingItem(this._model, this._index);

  @override
  Widget build(BuildContext context) {
    if (this._model == null) {
      return null;
    }
    return Row(children: <Widget>[
      Text(_index.toString() + ' +++ '),
      Text(_model.address)
    ]);
  }
}
