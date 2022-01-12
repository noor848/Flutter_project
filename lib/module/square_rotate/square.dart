import 'dart:math';

import 'package:bma/module/square_rotate/state_square.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit_squar.dart';

class Square extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context)=>SquareCubit(),
      child: BlocConsumer<SquareCubit,squareState>(
      builder: (context, state) =>  Scaffold(
        appBar: AppBar(),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Transform.translate(
             offset:Offset(SquareCubit.get(context).value, 0) ,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.pinkAccent,
                ),
              ),
              SizedBox(height: 10,),

              Text("Value : ${SquareCubit.get(context).value.round()}",style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),

              Slider(
                  value:SquareCubit.get(context).value ,
                  min: 0,
                  max: 100,
                  onChanged: (x){
SquareCubit.get(context).getVlaue(x);
              })
            ],
          ),
        ),

      ),
        listener: (context, state) => {},

      ),
    );
  }
}
