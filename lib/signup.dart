import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'counter.dart';


class SignupPage extends StatefulWidget {

  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();

}


class _SignupPageState extends State<SignupPage>{


  final TextEditingController usernameController =
  TextEditingController();


  final TextEditingController emailController =
  TextEditingController();


  final TextEditingController passwordController =
  TextEditingController();


  final TextEditingController confirmController =
  TextEditingController();



  bool passwordHidden = true;

  bool confirmHidden = true;


  String errorMessage = "";




  Future<void> signup() async{


    String username =
    usernameController.text.trim();


    String email =
    emailController.text.trim();


    String password =
    passwordController.text.trim();


    String confirm =
    confirmController.text.trim();




    if(username.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirm.isEmpty){


      setState((){

        errorMessage =
        "Please fill all fields";

      });


      return;

    }





    if(password != confirm){


      setState((){

        errorMessage =
        "Password does not match";

      });


      return;

    }






    try{


      UserCredential userCredential =
await FirebaseAuth.instance
    .createUserWithEmailAndPassword(
      email: email,
      password: password,
    );


await userCredential.user!.updateDisplayName(username);





      if(mounted){


        Navigator.pushReplacement(


          context,


          MaterialPageRoute(


            builder:(context)=>CounterPage(


              username: username,


            ),


          ),


        );


      }




    }


    on FirebaseAuthException catch(e){



      setState((){


        errorMessage =
            e.message ?? "Signup Failed";


      });


    }




  }






  @override
  Widget build(BuildContext context){


    return Scaffold(



      body:Container(



        width:double.infinity,


        height:double.infinity,



        decoration:const BoxDecoration(



          image:DecorationImage(



            image:NetworkImage(

              "https://images.unsplash.com/photo-1590860490861-fb619a82174b?w=700",

            ),


            fit:BoxFit.cover,


          ),



        ),





        child:Center(



          child:Container(



            width:350,


            padding:
            const EdgeInsets.all(25),





            decoration:BoxDecoration(



              color:
              Colors.white.withOpacity(0.85),



              borderRadius:
              BorderRadius.circular(20),



            ),





            child:SingleChildScrollView(



              child:Column(



                children:[





                  const Text(



                    "Create Account",



                    style:TextStyle(



                      fontSize:30,


                      fontWeight:
                      FontWeight.bold,



                    ),



                  ),






                  const SizedBox(height:25),






                  buildField(

                    controller:usernameController,

                    hint:"Username",

                    icon:Icons.person,

                  ),



                  const SizedBox(height:15),






                  buildField(

                    controller:emailController,

                    hint:"Email",

                    icon:Icons.email,

                  ),





                  const SizedBox(height:15),





                  TextField(



                    controller:
                    passwordController,



                    obscureText:
                    passwordHidden,



                    decoration:
                    passwordDecoration(

                      "Password",

                      passwordHidden,

                          (){

                        setState((){

                          passwordHidden =
                          !passwordHidden;

                        });


                      },

                    ),



                  ),





                  const SizedBox(height:15),





                  TextField(



                    controller:
                    confirmController,



                    obscureText:
                    confirmHidden,



                    decoration:
                    passwordDecoration(

                      "Confirm Password",

                      confirmHidden,

                          (){


                        setState((){

                          confirmHidden =
                          !confirmHidden;

                        });


                      },

                    ),



                  ),







                  const SizedBox(height:15),






                  Text(



                    errorMessage,



                    style:const TextStyle(



                      color:Colors.red,


                      fontWeight:
                      FontWeight.bold,



                    ),



                  ),






                  const SizedBox(height:20),






                  SizedBox(



                    width:300,


                    height:50,



                    child:ElevatedButton(



                      onPressed:signup,



                      style:
                      ElevatedButton.styleFrom(



                        backgroundColor:
                        Colors.blueGrey,



                        shape:
                        RoundedRectangleBorder(



                          borderRadius:
                          BorderRadius.circular(15),



                        ),



                      ),





                      child:
                      const Text(



                        "Create Account",



                        style:TextStyle(



                          color:Colors.white,


                          fontSize:18,


                          fontWeight:
                          FontWeight.bold,



                        ),



                      ),



                    ),



                  ),





                ],



              ),



            ),



          ),



        ),



      ),



    );



  }








  Widget buildField({


    required TextEditingController controller,


    required String hint,


    required IconData icon,


  }){


    return TextField(


      controller:controller,


      decoration:InputDecoration(


        hintText:hint,


        prefixIcon:
        Icon(icon),


        filled:true,


        fillColor:Colors.white,


        border:
        OutlineInputBorder(


          borderRadius:
          BorderRadius.circular(15),


        ),


      ),


    );


  }








  InputDecoration passwordDecoration(


      String hint,


      bool hidden,


      VoidCallback press,


      ){


    return InputDecoration(



      hintText:hint,



      prefixIcon:
      const Icon(Icons.lock),




      suffixIcon:
      IconButton(



        icon:Icon(


          hidden
              ? Icons.visibility_off
              : Icons.visibility,


        ),



        onPressed:press,



      ),





      filled:true,



      fillColor:Colors.white,



      border:
      OutlineInputBorder(



        borderRadius:
        BorderRadius.circular(15),



      ),



    );

  }


}