import 'package:flutter/material.dart';


class NoteList extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return _NoteList();
  }
}

class _NoteList extends State<NoteList>{
  int count=0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes')
      ),
      body: getNoteListVie(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          debugPrint('Float pressed');
        },
        tooltip: 'Add Note',
        child: Icon(Icons.add)
      ),
    );
  }

  ListView getNoteListVie(){
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position){
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(Icons.keyboard_arrow_right)),
            title: Text('Dummy Title'),
            subtitle: Text('Dummy Date'),
            trailing: Icon(Icons.delete, color: Colors.grey,),
            onTap: (){
              debugPrint('on tap');
            },
          ),
        );
      }
    );
  }
}