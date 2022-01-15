
import 'package:bloc/bloc.dart';
import 'package:bma/counter.dart';
import 'package:bma/module/counter/cubit.dart';
import 'package:bma/module/counter/statecounter.dart';
import 'package:bma/shared/shredpre.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_services_binding/flutter_services_binding.dart';
import 'BMI_cal.dart';
import 'layout/cubitnes/cubitnews.dart';
import 'layout/cubitnes/newslayout.dart';
import 'layout/cubitnes/statesnews.dart';
import 'layout/todo_list.dart';
import 'login_page.dart';
import 'module/square_rotate/square.dart';
import 'network/dio_hepler.dart';
import 'shared/blocobserver.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  SharedPre.init_shared();
  BlocOverrides.runZoned(
        () {
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (BuildContext context) =>NewsCubit()..get_dtat()..get_dtat_science()..get_dtat_sport()..GetSHared() )
      ],
      child: BlocConsumer<NewsCubit,StatesNews>(
        builder: (context, state) =>
       MaterialApp(
          title: "App News ",
          locale: Locale('ar'),
          color: Colors.orangeAccent,
themeMode: NewsCubit.get(context).flag ==false?ThemeMode.dark:ThemeMode.light,
          theme: ThemeData(

            appBarTheme: AppBarTheme(
              color: Colors.white,
                  elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.orange,
                systemNavigationBarColor: Colors.blue, // Navigation bar

              ),
              iconTheme: IconThemeData(
                color: Colors.orangeAccent
              )
            ),
scaffoldBackgroundColor: Colors.white,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: Colors.deepOrangeAccent[200],
                unselectedItemColor: Colors.orangeAccent[200],



            )



          ),

          darkTheme:  ThemeData(
            primaryColor:Colors.orangeAccent ,
              primaryColorDark: Colors.red,

              iconTheme: IconThemeData(
              color: Colors.orangeAccent,
            ),
              primaryIconTheme:IconThemeData(
                color: Colors.orangeAccent
              ) ,

              textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),

              appBarTheme: AppBarTheme(


                  foregroundColor: Colors.white ,//here you can give the text color
                  color: Colors.black,
                  elevation: 0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.orange,
                    systemNavigationBarColor: Colors.orangeAccent, // Navigation bar

                  ),
                  iconTheme: IconThemeData(
                      color: Colors.orangeAccent
                  )
              ),
              scaffoldBackgroundColor: Colors.black,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.black,
                selectedItemColor: Colors.deepOrangeAccent[200],
                unselectedItemColor: Colors.orangeAccent[200],


              )



          ),


          debugShowCheckedModeBanner: false,
          home: Directionality(
              textDirection:TextDirection.rtl ,
              child: NewsLayot()),



        ),
        listener: (context, state) {

        },
      ),
    );
  }
}



