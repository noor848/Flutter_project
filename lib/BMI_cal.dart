import 'package:bma/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMI extends StatefulWidget {


  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  var whoam=false;
  var  age=0;
  var  height=0.0;
  var weight=0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        elevation: 0,
        title: Center(
            child:Text("BMI Calculator",style: TextStyle(color: Colors.white),)),
      ),
body: Padding(
  padding: const EdgeInsets.all(10.0),
  child:   Column(

    children: [

      Row(
         mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Expanded(
            child: GestureDetector(
              onTap:(){

                setState(() {
                  whoam=false;
                });

              } ,
              child: Container(
                decoration: BoxDecoration(
                    color:  !whoam?Colors.indigo:Colors.indigoAccent,
                  borderRadius: BorderRadiusDirectional.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(

                    children: [
                      Icon(Icons.male,color: Colors.white,size: 120,),
                      Text("MALE",style: TextStyle(color: Colors.white.withOpacity(.8),fontWeight: FontWeight.w600,fontSize: 25),)

                    ],



                  ),
                ),
              ),
            ),
          ),
SizedBox(
  width: 20,
),
          Expanded(
            child: GestureDetector(
              onTap: (){
                setState(() {
                  whoam=true;

                });

              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(20)
                      , color: whoam?Colors.indigo:Colors.indigoAccent,
                ),

                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(

                      children: [

                        Icon(Icons.female,color: Colors.white,size: 120,),

                        Text("FEMALE",style: TextStyle(color: Colors.white.withOpacity(.8),fontWeight: FontWeight.w600,fontSize: 25),)

                      ],



                    ),
                  ),
                ),
            ),
          ),


        ],

      ),
SizedBox(height: 20,),
Container(
  decoration: BoxDecoration(
      color: Colors.indigo,
      borderRadius: BorderRadiusDirectional.circular(20)
  ),
  child:   Padding(
    padding: const EdgeInsets.all(8.0),
    child:   Column(

      children: [
        SizedBox(height: 10,),
        Text("HEIGHT",style: TextStyle(color: Colors.white.withOpacity(.8),
        fontSize: 20,fontWeight: FontWeight.w500
        ),),
        SizedBox(height: 10,),
        Row(

          mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline:TextBaseline.alphabetic ,
          children: [

            Text('${height}',style: TextStyle(fontSize: 45,fontWeight: FontWeight.w700,color: Colors.white
            ),),
            Text("cm",style: TextStyle(color: Colors.white),),
          ],



        ),

        Slider(
            max: 100,
            inactiveColor: Colors.indigoAccent,
            activeColor: Colors.pinkAccent,
            value: height,
            onChanged:(double x){
              setState(() {

                 height= x.roundToDouble(); // Safe

              });
        })

      ],



    ),
  ),
),
SizedBox(
  height: 10,
),
Row(
  children: [
Expanded(
  child:   Container(
  
  
  
    decoration: BoxDecoration(
  
      color: Colors.indigo,
  
        borderRadius: BorderRadiusDirectional.circular(20)
  
    ),
  
    child:   Padding(
  
      padding: const EdgeInsets.all(30.0),
  
  
  
      child:Column(
  
        children: [
  
          Text("AGE",style: TextStyle(color: Colors.white.withOpacity(.8),fontSize: 17,fontWeight: FontWeight.w600),),
  
          SizedBox(height: 5,),
  
  
  
          Text("$age",style: TextStyle(color: Colors.white.withOpacity(1),fontSize:30,fontWeight: FontWeight.w600),),
  
          SizedBox(height: 5,),
  
          Row(

            children: [
  
              CircleAvatar(
  
                backgroundColor: Colors.pinkAccent,
  
                child: TextButton(child: Text("-",style: TextStyle(color: Colors.white,fontSize:20),),onPressed: (){
                  setState(() {
                    age--;
                  });

                },
  
                ),
  
  
  
              ),
  
              SizedBox(width: 10,),
  
              CircleAvatar(
  
                backgroundColor: Colors.pinkAccent,
  
                child: TextButton(child: Text("+",style: TextStyle(color: Colors.white,fontSize:20),),onPressed: (){
                  setState(() {
                    age++;
                  });

                },
  
                ),
  
  
  
              ),
  
  
  
            ],


  
          )







        ],


  
      ),
  
  
  
    ),
  
  ),
),
SizedBox(width: 20,),
    Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadiusDirectional.circular(20)
        ),
        child:   Padding(
          padding: const EdgeInsets.all(30.0),

          child:   Column(

            children: [

              Text("WEIGHT",style: TextStyle(color: Colors.white.withOpacity(.8),fontSize: 17,fontWeight: FontWeight.w600),),
              SizedBox(height: 5,),

              Text("$weight",style: TextStyle(color: Colors.white.withOpacity(1),fontSize:30,fontWeight: FontWeight.w600),),
              SizedBox(height: 5,),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.pinkAccent,
                    child: TextButton(child: Text("-",style: TextStyle(color: Colors.white,fontSize:20),),onPressed: (){
                      setState(() {
                        weight--;
                      });
                    },
                    ),

                  ),
                  SizedBox(width: 10,),
                  CircleAvatar(
                    backgroundColor: Colors.pinkAccent,
                    child: TextButton(child: Text("+",style: TextStyle(color: Colors.white,fontSize:20),),onPressed: (){
                      setState(() {
                        weight++;
                      });
                    },
                    ),

                  ),

                ],

              )



            ],

          ),

        ),
      ),
    )



  ],
),
Spacer(),

Container(
  width: double.infinity,
  child:   MaterialButton(onPressed: (){

Navigator.push(context,MaterialPageRoute(builder: (context) => Result(
  height: height,
  age: age,
  gender: whoam,
  weight: weight,

)));


  },
    child: Text("Calculate",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),padding:EdgeInsetsDirectional.all(20),color: Colors.pinkAccent,
  ),
)

    ],

  ),
),

    );
  }
}
