
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealapp/modules/staticdata.dart';

import '../dummy_data.dart';

class Recipe extends StatefulWidget {

  late String id;


  Recipe({
    required this.id
});

  @override
  State<Recipe> createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  bool flag=false;
 late  List rec=[];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    for (var element in DUMMY_MEALS) {
      if(element.id==widget.id){
        rec.add(element);

      }

    }


    return Scaffold(
      appBar: AppBar(

        leading: IconButton(icon: Icon(Icons.keyboard_backspace),
          onPressed: () {
            Navigator.pop(context);},

        ),

      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
Container(

  child: Image(image: NetworkImage(rec[0].imageUrl),
  ),
),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text("Ingredients",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                child: Card(

color: Colors.orange[200],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(itemBuilder: (context, index) =>
                        ing(rec[0].ingredients[index]),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 5,
                        ),
                        itemCount: (rec[0].ingredients.length),
                ),
                  ),
              ),
            )






            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text("Steps",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
            ),

            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  child: Card(

                    color: Colors.orangeAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(itemBuilder: (context, index) =>
                          ing(rec[0].steps[index]),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 5,
                        ),
                        itemCount: (rec[0].steps.length),
                      ),
                    ),
                  ),
                )






            )],

        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(!rec[0].fav?Icons.star_border:Icons.star),
        onPressed: () {

setState(() {
  flag=!flag;
  rec[0].fav=flag;
  if(rec[0].fav){

   if( !S_data.Fav_meal.contains(rec[0]))
    S_data.Fav_meal.add(rec[0]);


  }
  else{
    S_data.Fav_meal.remove(rec[0]);
  }

});

        },



      ),
    );
  }

  Widget ing(index){

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(index),
        ),
      ),
    );


  }
}
