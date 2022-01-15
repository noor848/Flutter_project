import 'package:dio/dio.dart';

class DioHelper {


static Dio ?dio;


static void  init(){
dio=Dio(
    BaseOptions(

      baseUrl: 'https://newsapi.org/',

    )
);

get_dta();
}

static List<dynamic> ? data_get;

static List? get_dta() {


  return data_get;
}




}






