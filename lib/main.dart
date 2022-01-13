
import 'package:bloc/bloc.dart';
import 'package:bma/counter.dart';
import 'package:bma/module/counter/cubit.dart';
import 'package:bma/module/counter/statecounter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_services_binding/flutter_services_binding.dart';
import 'BMI_cal.dart';
import 'layout/todo_list.dart';
import 'login_page.dart';
import 'module/square_rotate/square.dart';
import 'shared/blocobserver.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(
        () {
//code
      runApp(MyApp(

      ));
    },
    blocObserver: MyBlocObserver(),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key, startWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: MainToDO(),



    );
  }
}



