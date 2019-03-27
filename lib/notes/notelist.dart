import 'package:flutter/material.dart';
import 'package:tflutter/notes/notedetail.dart';

class NoteList extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return _NoteList();
  }
}

class _NoteList extends State<NoteList>{
  int count=0;

  void navigateToDetail(String title){
    Navigator.push(context, MaterialPageRoute(builder: (context){
            return NoteDetail(title: title);
          }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes')
      ),
      body: getNoteListVie(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          navigateToDetail('Add Note');
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
              navigateToDetail('Edit Note');
            },
          ),
        );
      }
    );
  }
}