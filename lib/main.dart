
import 'package:bma/counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BMI_cal.dart';
import 'login_page.dart';
import 'messenger.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: BMI(),



    );
  }
}



