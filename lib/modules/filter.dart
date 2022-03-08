import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealapp/modules/staticdata.dart';

class Filters extends StatefulWidget {

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {

  List<String>fi=["GlutenFree","Vegan","Vegetarian","LactoseFree"
  ];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
    children: [
      ListTile(

      trailing: Switch(
    onChanged: (bool value) {

    setState(() {
      S_data.switch1=value;

    });

    }, value:S_data. switch1,
    activeColor: Colors.orangeAccent,


    ),
    title:Text("GlutenFree")
    ),
      ListTile(

          trailing: Switch(
            onChanged: (bool value) {

              setState(() {
                S_data. switch2=value;

              });

            }, value:S_data.switch2,
            activeColor: Colors.orangeAccent,


          ),
          title:Text("Vegan")
      ),
      ListTile(

          trailing: Switch(
            onChanged: (bool value) {

              setState(() {
                S_data. switch3=value;

              });

            }, value:S_data. switch3,
            activeColor: Colors.orangeAccent,


          ),
          title:Text("LactoseFree")
      ),
      ListTile(
          trailing: Switch(
            onChanged: (bool value) {

              setState(() {
                S_data.   switch4=value;

              });

            }, value: S_data.switch4,
            activeColor: Colors.orangeAccent,


          ),
          title:Text("Vegetarian")

      )
      ],
    ));




  }
}
