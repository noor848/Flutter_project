import 'package:bloc/bloc.dart';
import 'package:bma/layout/state_todo.dart';
import 'package:bma/module/todo/archive.dart';
import 'package:bma/module/todo/done.dart';
import 'package:bma/module/todo/list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class Cubittodo extends Cubit<StateToDO>{
  Cubittodo() : super(initialState());

  static  Cubittodo get(context)=>BlocProvider.of(context);
  int index=0;


  Database ?  database;

  List<Widget>windows=[List1(),Done(),Archive()];


  void change_window(index){


    this.index=index;

    getData();

    emit(ChangedIndex());

  }


  void   create_database()async{
     database = await openDatabase("todo1.db",
         version: 1,
        onOpen: (Database db ){
        getData();
          print("opened");
          print(db);

        },
        onCreate: (Database db, int version)   async {
       await  db.execute(
              'CREATE TABLE datab2 (id INTEGER PRIMARY KEY, date TEXT,time TEXT,title TEXT,status TEXT)');
        });
     emit(CreatedDatabase());
    getData();
  }


  void insert_Database(

  {
    title,time,date
}) async {
    print(database);

    await database?.transaction((txn) async {
    await txn.rawInsert(
          'INSERT INTO datab2(date,time, title,status) VALUES("$date","$time","$title","new")');

      });

    print("inserted!");
    emit(InsertedIntoDatabase());

    getData();




  }

  var closed=false;

void closed1(){

    closed=!closed;
    emit(close());

}
  List<Map> ?list=[];
List<Map>?done=[];
  List<Map>?archive1=[];
void  getData()  {

    database?.rawQuery('SELECT * FROM datab2').then((value){
      list=[];
      done=[];
      archive1=[];

      for (var element in value) {
     if(element['status']=="new"){
       list?.add(element);
     }
     else if(element['status']=="done"){
       done?.add(element);
     }
     else if(element['status']=="ar"){
       archive1?.add(element);
     }
    }
   emit(GetDataState());
    print(archive1);
    print(done);
    print(list);
   }).catchError((onError){
     print(onError);

   });




}

  void delte_elemnt(
      {
        index
      }
      ){

    database?.rawDelete('DELETE FROM datab2 WHERE id = ?', [index]).then((value) {

      print(value);
      emit(Deleted());
      getData();


    }).catchError((onError){

      print(onError);

    });
  }

Future<void> update(
  {
    status,
    index

}
 ) async {

  int? count = await database?.rawUpdate(
      'UPDATE datab2 SET status = ? where id=?',
      ['$status',index]);

emit(Updated());
  getData();
}








}