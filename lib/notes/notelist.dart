import 'package:flutter/material.dart';
import 'package:tflutter/notes/notedetail.dart';
import 'models/note.dart';
import 'utils/database_helper.dart';
import 'package:intl/intl.dart';

class NoteList extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return _NoteListState();
  }
}

class _NoteListState extends State<NoteList>{
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count=0;

  void navigateToDetail(Note note, String title) async{
    var ret= await Navigator.push(context, MaterialPageRoute(builder: (context){
            return NoteDetail(note, title);
          }));
    if(ret ==true){
      updateListview();
    }
  }

  @override
  Widget build(BuildContext context) {
    if(noteList ==null){
      noteList = List<Note>();
      updateListview();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Notes')
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          navigateToDetail(Note('', '', 2), 'Add Note');
        },
        tooltip: 'Add Note',
        child: Icon(Icons.add)
      ),
    );
  }

  ListView getNoteListView(){
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position){
        var cnote = this.noteList[position];
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: getPriorityColor(cnote.priority),
              child: getPriorityIcon(cnote.priority)),
            title: Text(cnote.title),
            subtitle: Text(cnote.date),
            trailing: GestureDetector(
              child: Icon(Icons.delete, color: Colors.grey,),
              onTap: (){
                _delete(context, cnote);
              },
            ),
            onTap: (){
              navigateToDetail(cnote, 'Edit Note');
            },
          ),
        );
      }
    );
  }

  Color getPriorityColor(int priority){
    switch(priority){
      case 1:
        return Colors.red;
      default:
        return Colors.yellow;
    }
  }

  Icon getPriorityIcon(int priority){
    switch(priority){
      case 1:
        return Icon(Icons.play_arrow);
      default:
        return Icon(Icons.keyboard_arrow_right);
    }
  }

  void _delete(BuildContext context, Note note) async{
    int result =await databaseHelper.deleteNote(note.id);
    if(result !=0){
      _showSnackBar(context, 'Note deleted successfully');
      updateListview();
    }
  }

  void _showSnackBar(BuildContext context, String message){
    final snackBar =SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void updateListview() async{
    await databaseHelper.initialized();
    var notelist =await databaseHelper.getNoteList();
    setState(() {
      this.noteList =notelist;
      this.count =notelist.length;
    });
  }
}