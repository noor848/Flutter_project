
import 'package:bma/layout/cubitnes/statesnews.dart';
import 'package:bma/module/news/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubitnews.dart';

class NewsLayot extends StatelessWidget {
  const NewsLayot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,StatesNews>(
      listener: (context, state) => {},
      builder: (context, state) =>Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){
              NewsCubit.get(context).change_theme();
              NewsCubit.get(context).setSharedpre(value:NewsCubit.get(context).flag);
              NewsCubit.get(context).GetSHared();
            }, icon: Icon(Icons.wb_sunny)),
            IconButton(onPressed: (){

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  Search1()),
              );

            }, icon: Icon(Icons.search)),


          ],
          title: Text("App News",style: Theme.of(context).textTheme.headline5
          ),
        ),
        body: NewsCubit.get(context).windows[NewsCubit.get(context).index],

        bottomNavigationBar: BottomNavigationBar(
currentIndex: NewsCubit.get(context).index ,
          items: NewsCubit.get(context).items,
          onTap: (index){

            NewsCubit.get(context).change_index(index);

          },

        ),


      ),
    );
  }
}
