import 'package:flutter/material.dart';

import 'modules/categories.dart';

void main() {
  runApp( MyApp());
}

class  MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Categoreos(),


    );
  }




}