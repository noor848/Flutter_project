import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
      var height=0.0,weight=0.0,age=0,result=0.0;
      var gender;
      Result({

       required this.height,
        required this.weight,
        required this.age,
       required this.gender,



});

      double resl(){
        return ((weight/pow(height,2))*100);
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      appBar: AppBar(

        elevation: 0,
        backgroundColor: Colors.indigoAccent,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
          icon: Icon(Icons.backspace),

        ),
      ),
      body: Center(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("Gender: ${gender?"Female":"Male"}",style: TextStyle(color: Colors.white,fontSize: 30),),
            Text("age: $age",style: TextStyle(color: Colors.white,fontSize: 30)),
            Text("Result: ${resl().toStringAsPrecision(3)}",style: TextStyle(color: Colors.white,fontSize: 30))

          ],
        ),
      ),

    );
  }
}
