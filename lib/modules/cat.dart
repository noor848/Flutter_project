

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';
import 'meals.dart';

class Cat extends StatelessWidget {
  const Cat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(DUMMY_CATEGORIES.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 5),
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      Meals(
                        id: DUMMY_CATEGORIES[index].id,
                      )),
                );
              },
              child: Container(
                clipBehavior: Clip.antiAlias,

                decoration: BoxDecoration(
                    color:DUMMY_CATEGORIES[index].color ,

                    borderRadius: BorderRadius.circular(20)
                ),
                width: double.infinity,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(DUMMY_CATEGORIES[index].title,
                    style: TextStyle(fontSize: 20),textAlign: TextAlign.start,),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
