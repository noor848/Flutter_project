import 'package:bma/layout/state_todo.dart';
import 'package:bma/layout/state_todo.dart';
import 'package:bma/layout/state_todo.dart';
import 'package:bma/layout/state_todo.dart';
import 'package:bma/shared/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'cubit_todo.dart';

class MainToDO extends StatelessWidget {
var scafolkey=GlobalKey<ScaffoldState>();
var title= TextEditingController();
var date= TextEditingController();
var time= TextEditingController();
 var _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return Cubittodo()..create_database();
      },
      child: BlocConsumer<Cubittodo,StateToDO>(
        builder:  (context, state) =>
            Scaffold(
          key: scafolkey,
          appBar: AppBar(title: Center(child: Text("TO DO App")),),
          body: Form(
            key: _formKey,
            child: Column(
              children: [
                Cubittodo.get(context).windows[ Cubittodo.get(context).index]
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Cubittodo.get(context).closed1();

              if(Cubittodo.get(context).closed){
              scafolkey.currentState?.showBottomSheet(
                    (context) =>
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          texField(
                              func: (){
                                showDatePicker(context: context,
                                    initialDate: DateTime.now()
                                    , firstDate: DateTime.now(),
                                    lastDate: DateTime(2101)).then((value){
                                  final DateFormat formatter = DateFormat('yyyy-MM-dd');
                                  final String formatted = formatter.format(value!);
                                  date.text=formatted;
                                  print(formatted);
                                });

                              },
                              hintext: "Date",
                              valid: "enter the date ",
                              controll: date,
                              icon: Icon(Icons.date_range)
                          ),
                          SizedBox(height: 10,),
                          texField(
                              hintext: "time",
                              controll: time,

                              valid: "enter the time",
                              func: (){
                                showTimePicker(context: context,

                                  initialTime: TimeOfDay.now(),
                                ).then((value) =>{
                                  time.text=value!.format(context)

                                });

                              },
                              icon: Icon(Icons.time_to_leave_sharp)
                          ),            SizedBox(height: 10,),

                          texField(
                            controll: title,

                            hintext: "title",
                            valid: "Enter the title ",
                            icon: Icon(Icons.text_fields),

                          )

                        ],
                      ),
                    ),
                  ),
              );}
              else if(Cubittodo.get(context).closed==false){
                if (date!="" &&time !=""&&title!="") {
                  print(date.text);
                  Cubittodo.get(context).insert_Database(date: date.text,time: time.text,title: title.text);
                  Navigator.pop(context);

                }

              }
            },
            child: Icon(Icons.add),


          ),
          bottomNavigationBar:   BottomNavigationBar(

            onTap:(index){
              Cubittodo.get(context).change_window(index);
            } ,
            items: [
              BottomNavigationBarItem(icon:Icon(Icons.task),label: "Tasks",),
              BottomNavigationBarItem(icon:Icon(Icons.done),label: "Done"),
              BottomNavigationBarItem(icon:Icon(Icons.archive),label: "archived"),


            ],

            currentIndex:Cubittodo.get(context).index,
            unselectedItemColor: Colors.blueGrey,
            selectedItemColor: Colors.blue,


          ),



        ),
        listener:(context, state) => {}
      ),
    );
  }
}
