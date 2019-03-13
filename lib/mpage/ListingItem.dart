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
    return new Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
          image: new NetworkImage(this._model.tnImgPath),
          fit: BoxFit.cover,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
          Text(
            _model.price,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Text(
            _model.fullAddress,
            style: TextStyle(color: Colors.white, fontSize: 20),
          )
        ]),
        height: 250);
  }
}
