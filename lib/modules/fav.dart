import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealapp/models/mea.dart';
import 'package:mealapp/modules/recipe.dart';
import 'package:mealapp/modules/staticdata.dart';

class Fav extends StatelessWidget {
  const Fav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (context, index) => g(index,context)
        , separatorBuilder: (context, index) => SizedBox(height: 10,)
        , itemCount:S_data.Fav_meal.length);
  }


  Widget g(index,context){
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
              Recipe(
                id:S_data.Fav_meal[index].id ,
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
                        child: Image(image: NetworkImage("${S_data.Fav_meal[index].imageUrl}",

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
                            child: Text("${S_data.Fav_meal[index].title}",
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
                          Text("${S_data.Fav_meal[index].duration }min"),
                          SizedBox(width: 8),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.work),
                          SizedBox(width: 5,),
                          Text("${work(S_data.Fav_meal[index].complexity)}"),
                          SizedBox(width: 8),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.monetization_on_outlined),
                          SizedBox(width: 5,),
                          Text("${affor(S_data.Fav_meal[index].affordability)}"),
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
}
