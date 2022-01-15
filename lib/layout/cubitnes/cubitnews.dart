import 'package:bloc/bloc.dart';
import 'package:bma/layout/cubitnes/statesnews.dart';
import 'package:bma/module/news/business.dart';
import 'package:bma/module/news/science.dart';
import 'package:bma/module/news/sport.dart';
import 'package:bma/network/dio_hepler.dart';
import 'package:bma/shared/shredpre.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<StatesNews>{
  NewsCubit() : super(InitialState());

   static NewsCubit get(context)=>BlocProvider.of(context);
  List<Widget>windows=[
  Business(),
  Sport(),
  Science()

  ];
  List<BottomNavigationBarItem> items=[
    BottomNavigationBarItem(icon:Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(icon:Icon(Icons.sports_baseball), label: "Sport"),
    BottomNavigationBarItem(icon:Icon(Icons.science_outlined), label: "Science")
  ];

  int index=0;

  void change_index(index){

    this.index=index;

    if(index==0){
      get_dtat();
    }
    emit(Change_index());

  }
   List<dynamic> ? data_get;
  List<dynamic> ? data_get_sport;
  List<dynamic> ? data_get_science;
  void get_dtat({
  data
}){

    DioHelper.dio?.get('/v2/top-headlines',
        queryParameters:
        {'country': 'eg', 'category': 'business', 'apiKey': '3de6bc9e6aa24c62b4ec218c06bfa108'}
    ).then((value){

      data_get=value.data['articles'];
      print(data_get);
      emit(DtaGet());

    } ).catchError((onError){

      print(onError);


    });


  }


  void get_dtat_sport({
    data
  }){

    DioHelper.dio?.get('/v2/top-headlines',
        queryParameters:
        {'country': 'eg', 'category': 'sport', 'apiKey': '3de6bc9e6aa24c62b4ec218c06bfa108'}
    ).then((value){

      data_get_sport=value.data['articles'];
      print(data_get_sport);
      emit(DtaGet_Sport());

    } ).catchError((onError){

      print(onError);


    });


  }

  void get_dtat_science({
    data
  }){

    DioHelper.dio?.get('/v2/top-headlines',
        queryParameters:
        {'country': 'eg', 'category': 'science', 'apiKey': '3de6bc9e6aa24c62b4ec218c06bfa108'}
    ).then((value){

      data_get_science=value.data['articles'];
      print(data_get_science);
      emit(DtaGet_Science());

    } ).catchError((onError){

      print(onError);


    });


  }

  bool  ?flag=false;
  void change_theme(){

   flag=!flag!;
   emit(ChangeTheme());


  }

  List<dynamic> ? search_data;
  void search({
    data
  }){

    DioHelper.dio?.get('/v2/everything',
        queryParameters:
        { 'q': '$data', 'apiKey': '3de6bc9e6aa24c62b4ec218c06bfa108'}
    ).then((value){
      search_data=value.data['articles'];
      print(search_data);
      emit(Search_data());

    } ).catchError((onError){

      print(onError);


    });


  }
bool ? dark;



  void setSharedpre({
  value
}){

    SharedPre.shared?.setBool("dark",value).then((value) {
    print("$value added");
    emit(SetSharedpre());
    }
    ).catchError((onError){
      print(onError);

    });
  }



void   GetSHared()  async {

 flag= await SharedPre.shared?.getBool("dark");
  emit(ChangedClor());
  print(flag);




}

}