
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealapp/models/mea.dart';
import 'package:mealapp/modules/recipe.dart';
import 'package:mealapp/modules/staticdata.dart';

import '../dummy_data.dart';

class Meals extends StatelessWidget {

   late String  id;
   late  List   meals=[];
   late  List   meals2=[];
   late List filted_data=[];
   late int i=0;
  Meals({

    required this.id
  }
   );


  @override
  Widget build(BuildContext context) {


    meals2=[];

   for (var element in DUMMY_MEALS) {

      if(element.categories.contains(id))
      {

        print(element.categories.contains(id));
        meals.add(element);

      }
    }


   for (var element in meals) {
     if (S_data.switch1&&element.isGlutenFree){
        if(!meals2.contains(element))
       meals2.add(element);
     }
    if (S_data.switch2&&element.isVegan){
       if(!meals2.contains(element))
         meals2.add(element);

     }
   if (S_data.switch3&&element.isLactoseFree){

       if(!meals2.contains(element))
         meals2.add(element);
     }
   if (S_data.switch4&&element.isVegetarian){
       if(!meals2.contains(element))
         meals2.add(element);
     }

if(!S_data.switch1&&!S_data.switch2&&!S_data.switch3&&!S_data.switch4){

  meals2.add(element);
}


   }





   return Scaffold(
      appBar: AppBar(
        title: Text("Meal"),
      ),
      body:ListView.separated(itemBuilder: (context, index) => g(index,context)
          , separatorBuilder: (context, index) => SizedBox(height: 10,)
          , itemCount: meals2.length),



    );
  }

  String work(x){

    if(x==Complexity1.Simple){

      return 'Simple';
    }
    if(x==Complexity1.Hard){

      return 'Hard';
    }
    if(x==Complexity1.Challenging){

      return 'Challenging';
    }
    return "Unknown";

  }
   String affor(x){

     if(x==Affordability.Affordable){

       return 'Affordable';
     }
     if(x==Affordability.Luxurious){

       return 'Luxurious';
     }
     if(x==Affordability.Pricey){

       return 'Pricey';
     }
     return "Unknown";

   }

  Widget g(index,context){

    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
              Recipe(
                id:meals2[index].id ,
              )),
        );


      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            clipBehavior: Clip.antiAlias,
            child:Column(
              children: [
                Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children:[
                      ClipRRect(
                        borderRadius: BorderRadius.only(topLeft:Radius.circular(30),
                          topRight:Radius.circular(30), ),
                        child: Image(image: NetworkImage("${meals2[index].imageUrl}",

                        ),
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,

                        ),


                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 40,
                          child: Center(
                            child: Text("${meals2[index].title}",
                              overflow: TextOverflow.ellipsis
                              ,style: TextStyle(color: Colors.white,fontSize: 20,
                              ),),
                          ),
                          decoration: BoxDecoration(

                            color: Colors.black45,
                          ),
                        ),
                      )

                    ]

                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      Row(
                        children: [
                          Icon(Icons.timelapse),
                          SizedBox(width: 5,),
                          Text("${meals2[index].duration }min"),
                          SizedBox(width: 8),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.work),
                          SizedBox(width: 5,),
                          Text("${work(meals2[index].complexity)}"),
                          SizedBox(width: 8),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.monetization_on_outlined),
                          SizedBox(width: 5,),
                          Text("${affor(meals2[index].affordability)}"),
                          SizedBox(width: 8),
                        ],
                      )
                    ],
                  ),
                )

              ],
            )


        ),
      ),
    );
  }

}
