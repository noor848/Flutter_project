import 'package:bma/layout/cubitnes/cubitnews.dart';
import 'package:bma/layout/cubitnes/newslayout.dart';
import 'package:bma/layout/cubitnes/statesnews.dart';
import 'package:bma/shared/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search1 extends StatelessWidget {
  var s=TextEditingController();
  @override
  Widget build(BuildContext context) {
 return BlocConsumer<NewsCubit,StatesNews>(
            listener: (BuildContext context, state) {  },
            builder: (BuildContext context, Object? state) {
              return Scaffold(
                  appBar: AppBar(),
                  body:  Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: texField(
                            func2: (value){
                          NewsCubit.get(context).search(data: value);
                            },
                            icon:Icon( Icons.search,color: Colors.orangeAccent,),
                            hintext: "search",
                            controll: s,
                          ),
                        ),

                        Expanded(
                          child: NewsCubit.get(context).search_data!=null?
                          ListView.separated(itemBuilder: (context, index) =>
                              data_get(context,index,NewsCubit.get(context).search_data)
                              , separatorBuilder:
                                  (context, index) =>  Container(
                                height: 1,
                                width: double.infinity,
                                color: Colors.grey[200],

                              ),
                              itemCount: NewsCubit.get(context).search_data?.length??0):Center(
                                child: CircularProgressIndicator(
                            color: Colors.orangeAccent,
                          ),
                              ),
                        )



                      ],
                    ),
                  )
              );
            },

          );

}}

