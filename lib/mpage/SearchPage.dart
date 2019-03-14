import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'models/MPageModel.dart';
import 'ListingItem.dart';

class SearchPage extends StatelessWidget {
  String title;
  MPageModel pageModel;
  ScrollController _scrollController = new ScrollController();

  SearchPage(String title) {
    this.title = title;

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        if (pageModel != null) {
          pageModel.loadData();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var modal = ScopedModel.of<MPageModel>(context);
    this.pageModel = modal;
    return Scaffold(
        appBar: AppBar(
          title: new Text(this.title),
        ),
        body:
            ScopedModelDescendant<MPageModel>(builder: (context, child, model) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                          child: TextField(
                        decoration:
                            InputDecoration(hintText: "Please input area",
                            contentPadding: const EdgeInsets.symmetric(vertical: 15.5)),
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                      )),
                      Container(
                          width: 50,
                          height: 50,
                          color: Colors.orange,
                          child: IconButton(
                              iconSize: 30,
                              icon: Icon(Icons.search),
                              color: Colors.white,
                              onPressed: () {}))
                    ]),
                Flexible(
                    child: Stack(children: <Widget>[
                  modal.listingCount > 0
                      ? ListView.builder(
                          controller: _scrollController,
                          shrinkWrap: true,
                          itemCount: model.listingCount,
                          itemBuilder: (BuildContext context, int index) {
                            return ListingItem(model.listings[index], index);
                          })
                      : Container(),
                  Visibility(
                      child: Center(child: CircularProgressIndicator()),
                      visible: model.isloadingData)
                ]))
              ]);
        }));
  }
}
