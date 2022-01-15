


import 'package:shared_preferences/shared_preferences.dart';

class SharedPre {
  static SharedPreferences ?shared;

  static void init_shared(){


  SharedPreferences.getInstance().then((value)  {

    shared=value;


  }).catchError((onError){

    print(onError.toString());

  });
}



}