
import 'package:bma/layout/cubit_todo.dart';
import 'package:bma/layout/state_todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Archive extends StatelessWidget {
  const Archive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Cubittodo, StateToDO>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          return Expanded(
              child: Cubittodo
                  .get(context)
                  .archive1!
                  .isNotEmpty ?
              ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => Dismissible(
                      onDismissed: (DismissDirection direction) {

                        Cubittodo.get(context).delte_elemnt(
                            index: Cubittodo.get(context).archive1?[index]['id']
                        );

                      },
                      background: Container(
                        color: Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsetsDirectional.only(
                                  end: 20
                              ),
                              child: Text("Delete",style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20
                              ),),
                            ),
                          ],
                        ),
                      ) ,
                      key: UniqueKey(),
                      child:card(context, index)),
                  separatorBuilder: (context, index) =>
                      Container(
                        height: 1,
                        color: Colors.grey[200],
                      ),
                  itemCount: Cubittodo
                      .get(context)
                      .archive1
                      ?.length ?? 0) : Center(
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.blueGrey,
                  ),
                ),));
        }
    );
  }

  Widget card(context,index)=>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: Text(Cubittodo.get(context).archive1?[index]["time"]??"",style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13
                    ),),
                    radius: 36,
                    backgroundColor: Colors.blue,
                  ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Cubittodo.get(context).archive1?[index]["title"]??"",style: TextStyle(
                          fontSize: 25
                      ),),
                      Text(Cubittodo.get(context).archive1?[index]["date"]??"",style: TextStyle(
                          color: Colors.grey[500],fontSize: 16
                      ),),

                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      IconButton(onPressed: (){

                        Cubittodo.get(context).update(status: "new",index: Cubittodo.get(context).archive1?[index]["id"]);


                      }, icon:Icon( Icons.close,color: Colors.red,)),
                      IconButton(onPressed: (){
                        Cubittodo.get(context).update(status: "done",index: Cubittodo.get(context).archive1?[index]["id"]);

                      }, icon:Icon( Icons.done_all,color: Colors.grey,))

                    ],
                  )
                ],
              )



            ],

          ),
        ),
      );

}