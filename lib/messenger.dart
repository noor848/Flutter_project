

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Messenger extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(

        titleSpacing: 5,
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  const [
      CircleAvatar(
        backgroundImage: AssetImage('images/profile.jpg'),
        radius: 20,),


          ],


        ),
actions: [
  CircleAvatar(
    backgroundColor: Colors.black,
    child: IconButton(icon:const Icon (Icons.camera_alt,color: Colors.white,), onPressed: () {  },),
  ),
  CircleAvatar(
    backgroundColor: Colors.black,
    child: IconButton(icon:const Icon (Icons.edit,color: Colors.white,), onPressed: () {  },),
  )
],
title:
       const Text("Chat" ,style: TextStyle(fontSize: 20,),),
        
      ),

       body: Padding(
         padding: const EdgeInsets.all(20.0),
         child: Column(
           children: [
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Container(
    height: 40,
    decoration: const BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.all(Radius.circular(10.0))
    ),
    child: Row(
      children: [
SizedBox(width: 10,),
Icon(
  Icons.search
),SizedBox(width: 10,)
          ,Text("Search",style: TextStyle(fontSize: 16),)

      ],
    ),

  ),
),
SizedBox(height: 6,),
Container(
  height: 100,
  width: double.infinity,
  child:   ListView.separated(itemBuilder: (context, index) => horizantal_img(),
    separatorBuilder: (context, index) => SizedBox(width: 10,),
    itemCount: 10,scrollDirection:Axis.horizontal ,),
),

   Expanded(
     child: Container(
       width: double.infinity,
       child: ListView.separated(itemBuilder: (context, index) => vertical(), separatorBuilder: (context, index) =>
           SizedBox(height: 10,)

           , itemCount:10 ),
     ),
   )

           ],
         ),
       ),




    );
  }




  Widget horizantal_img()=> Container(
    width: 80,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: const [

            CircleAvatar(
              backgroundImage: AssetImage("images/profile.jpg"),
              radius: 36,
            ),
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 10,
            ),
            CircleAvatar(
              backgroundColor: Colors.green,
              radius: 9,
            ),

          ],
        ),
        SizedBox(height: 5,),
        const Text("NoorBrccfccfvcfaik",style: TextStyle(color:Colors.white,fontSize: 15,fontWeight:FontWeight.bold, ),
        maxLines: 1,overflow:TextOverflow.ellipsis,)



      ],
    ),
  );
  Widget vertical()=> Row(
    children: [
      Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: const [

              CircleAvatar(
                backgroundImage: AssetImage("images/profile.jpg"),
                radius: 36,
              ),
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 10,
              ),
              CircleAvatar(
                backgroundColor: Colors.green,
                radius: 9,
              ),

            ],
          ),



        ],
      ),
      SizedBox(width: 10,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: 200,
              child: Text("Noor braikrfrfvvfvfvfgvfvgggvgvgfvgfv",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 25,),maxLines: 1,overflow: TextOverflow.ellipsis,)),
          SizedBox(height: 5,),
          Row(
            children: [
              Container(
                  width: 180,
                  child: Text("fmrkfmrkfmrkfmrkmfrkfmkrmfkrkfrkfmrk",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 14),
                    maxLines: 1,overflow:TextOverflow.ellipsis ,)),
              SizedBox(width: 30,),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue
                ),
              )
            ],
          ),


        ],
      ),


    ],
  );
}

