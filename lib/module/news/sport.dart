
import 'package:bma/layout/cubitnes/cubitnews.dart';
import 'package:bma/layout/cubitnes/statesnews.dart';
import 'package:bma/shared/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Sport extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<NewsCubit,StatesNews>(

        builder: (context, state) =>
        NewsCubit.get(context).data_get!=null?
        ListView.separated(itemBuilder: (context, index) =>
            data_get(context,index,NewsCubit.get(context).data_get_sport),
            separatorBuilder:(context, index) =>
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey[200],

                ),
            itemCount: NewsCubit.get(context).data_get?.length??0):Center(
          child: CircularProgressIndicator(
            color: Colors.orangeAccent,


          ),
        ),
        listener: (context, state) {

        },);
  }
}
