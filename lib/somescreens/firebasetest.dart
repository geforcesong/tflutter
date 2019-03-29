import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BandNames extends StatefulWidget {
  BandNames({Key key}) : super(key: key);

  @override
  _BandNames createState() => _BandNames();
}

class _BandNames extends State<BandNames> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Firebase Test')),
        body: StreamBuilder(
          stream: Firestore.instance.collection('bandnames').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: Text('Loading...'));
            }
            return ListView.builder(
              itemExtent: 80,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                return _buildListItem(context, snapshot.data.documents[index]);
              },
            );
          },
        ));
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Expanded(
            child: Text(document['name']),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.pink),
            padding: EdgeInsets.all(10),
            child: Text(document['votes'].toString(),
                style: Theme.of(context).textTheme.display1),
          )
        ],
      ),
      onTap: () {
        document.reference.updateData({
          'votes':document['votes'] +1
        });
      },
    );
  }
}
