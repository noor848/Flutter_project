


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class  LoginPage extends StatefulWidget {

  @override
  _State createState() => _State();
}

class _State extends State<LoginPage> {
  var emil=TextEditingController();
  var formkey=GlobalKey<FormState>();
  bool eye=true;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formkey,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your  Email';
                    }
                    return null;
                  },
                  keyboardType:TextInputType.emailAddress,

                  decoration:const InputDecoration(
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
                  obscureText:eye?true:false,
                  validator: (value){

                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;

                  },
                  keyboardType:TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon:  Icon(eye?Icons.remove_red_eye_outlined:Icons.remove_red_eye),
                        onPressed: (){
                          setState(() {
                            eye=!eye;

                          });


                        },
                      ),
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

                    if (formkey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }

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
      ),



    );
  }
}



