import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {


  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  var counter=0 ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Center(child: Text("Counter ",textAlign: TextAlign.center,)),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              TextButton(onPressed: (){
                setState(() {
                  counter++;
                });
              }, child:const Text("+",style: TextStyle(
                fontSize: 50
              ),) )
              ,SizedBox(width: 20,),Text("$counter",style: const TextStyle(
                fontSize: 20,fontWeight: FontWeight.w700
              ),),
              SizedBox(width: 20,),
   TextButton(onPressed: (){
     setState(() {
       counter--;
     });


   }, child:Text("-",style: TextStyle(
    fontSize: 50
    )))
            ],

          ),
        ],
      ),

    );
  }
}
