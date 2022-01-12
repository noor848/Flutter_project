


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {


        var emil=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            ///mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("Login",style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w700,

              ),),
SizedBox(height: 30,),
              TextFormField(
                keyboardType:TextInputType.emailAddress,

                 decoration:InputDecoration(
                     prefixIcon: Icon(Icons.email),
                  border:  OutlineInputBorder(
                 borderSide:  BorderSide(color: Colors.teal)
              ),
                  labelText: "Email",
                   hintText: "Enter Email"
              ),),
              SizedBox(height: 20,),
              TextFormField(
                controller: emil,
                obscureText:true,
                keyboardType:TextInputType.visiblePassword,
                decoration:InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                    border:  OutlineInputBorder(
                        borderSide:  BorderSide(color: Colors.teal)
                    ),
                    labelText: "Password",
                    hintText: "Enter password"
                ),),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: MaterialButton(onPressed: (){

                  print(emil.value);

                },
                  child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 15),),
                  color: Colors.blue,

                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text("Don't have account?"),
                  TextButton(onPressed: (){}, child: Text(
                    "Register Now !"
,style: TextStyle(color: Colors.blue),
                  ))

                ],
              )

            ],
          ),
        ),
      ),



    );
  }
}
