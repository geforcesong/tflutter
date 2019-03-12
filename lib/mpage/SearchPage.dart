import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'models/MPageModel.dart';

class SearchPage extends StatelessWidget {
  String title;
  MPageModel pageModel;
  ScrollController _scrollController = new ScrollController();

  SearchPage(String title) {
    this.title = title;

    _scrollController.addListener(() {
      if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent){
        if(pageModel != null){
          pageModel.loadData();
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    var modal = ScopedModel.of<MPageModel>(context);
    this.pageModel = modal;
    modal.loadData();
    return Scaffold(
        appBar: AppBar(
          title: new Text(this.title),
        ),
        body:
            ScopedModelDescendant<MPageModel>(builder: (context, child, model) {
          if (modal.listingCount <= 0) {
            return Text('noddata');
          }
          return ListView.builder(
            controller: _scrollController,
              itemCount: model.listingCount,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                    children: <Widget>[
                      Text(index.toString() + ' --- '),
                      Text(model.listings[index].address)]);
              });
        }));
  }
}
