import 'package:bma/module/counter/cubit.dart';
import 'package:bma/module/counter/statecounter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Counter extends StatelessWidget {
  var counter=0 ;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>CounterCubit(),
      child: BlocConsumer<CounterCubit,StateCounter>(

        builder: (BuildContext context, state) {
          return  Scaffold(
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
CounterCubit.get(context).plus();


                    }, child:const Text("+",style: TextStyle(
                        fontSize: 50
                    ),) )
                    ,SizedBox(width: 20,),Text("${CounterCubit.get(context).counter}",style: const TextStyle(
                        fontSize: 20,fontWeight: FontWeight.w700
                    ),),
                    SizedBox(width: 20,),
                    TextButton(onPressed: (){

                     CounterCubit.get(context).min();

                    }, child:Text("-",style: TextStyle(
                        fontSize: 50
                    )))
                  ],

                ),
              ],
            ),

          );
        },
        listener: (BuildContext context, Object? state) {  },

      ),
    );
  }
}
