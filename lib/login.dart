import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'counter.dart';
import 'forgot_password.dart';
import 'signup.dart';


class LoginPage extends StatefulWidget {

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

}



class _LoginPageState extends State<LoginPage> {


  final TextEditingController usernameController =
      TextEditingController();


  final TextEditingController passwordController =
      TextEditingController();



  String errorMessage = "";


  bool isPasswordHidden = true;



  // Email Login

  Future<void> login() async {


    String email =
        usernameController.text.trim();


    String password =
        passwordController.text.trim();



    if(email.isEmpty || password.isEmpty){

      setState((){

        errorMessage =
        "Please enter email and password";

      });

      return;

    }



    try {


      await FirebaseAuth.instance
          .signInWithEmailAndPassword(

        email: email,

        password: password,

      );



      if(mounted){


        String username =
            FirebaseAuth.instance.currentUser?.displayName
            ?? "User";



        Navigator.pushReplacement(

          context,

          MaterialPageRoute(

            builder:(context)=>
                CounterPage(

                  username: username,

                ),

          ),

        );


      }



    }


    on FirebaseAuthException catch(e){


      setState((){


        errorMessage =
            e.message ?? "Login Failed";


      });


    }


  }






  // Google Login

  Future<void> signInWithGoogle() async {


    try{


      GoogleAuthProvider googleProvider =
      GoogleAuthProvider();



      await FirebaseAuth.instance
          .signInWithPopup(googleProvider);



      if(mounted){



        String username =
            FirebaseAuth.instance.currentUser?.displayName
            ?? "User";




        Navigator.pushReplacement(



          context,



          MaterialPageRoute(



            builder:(context)=>
                CounterPage(

                  username: username,

                ),



          ),



        );



      }



    }


    catch(e){


      setState((){


        errorMessage =
            e.toString();


      });


    }



  }






  @override
  Widget build(BuildContext context) {


    return Scaffold(



      body: Container(



        width:double.infinity,


        height:double.infinity,



        decoration:const BoxDecoration(



          image:DecorationImage(



            image:NetworkImage(

              "https://images.unsplash.com/photo-1760389005000-bf02bf24f463?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxMHx8fGVufDB8fHx8fA%3D%3D",

            ),



            fit:BoxFit.cover,



          ),



        ),





        child:Padding(



          padding:
          const EdgeInsets.all(20),





          child:Center(



            child:SingleChildScrollView(



              child:Column(



                children:[





                  const Text(



                    "Login",



                    style:TextStyle(



                      fontSize:35,


                      fontWeight:
                      FontWeight.bold,


                      color:Colors.white,



                    ),



                  ),





                  const SizedBox(height:20),





                  SizedBox(



                    width:400,


                    height:50,



                    child:TextField(



                      controller:
                      usernameController,



                      decoration:InputDecoration(



                        hintText:"Email",



                        prefixIcon:
                        const Icon(Icons.email),



                        filled:true,



                        fillColor:
                        Colors.white,



                        border:
                        OutlineInputBorder(



                          borderRadius:
                          BorderRadius.circular(15),



                        ),



                      ),



                    ),



                  ),





                  const SizedBox(height:20),





                  SizedBox(



                    width:400,


                    height:50,



                    child:TextField(



                      controller:
                      passwordController,



                      obscureText:
                      isPasswordHidden,



                      decoration:InputDecoration(



                        hintText:"Password",



                        prefixIcon:
                        const Icon(Icons.lock),





                        suffixIcon:
                        IconButton(



                          icon:Icon(



                            isPasswordHidden

                                ? Icons.visibility_off

                                : Icons.visibility,



                          ),



                          onPressed:(){



                            setState((){



                              isPasswordHidden =
                              !isPasswordHidden;



                            });



                          },



                        ),





                        filled:true,



                        fillColor:
                        Colors.white,



                        border:
                        OutlineInputBorder(



                          borderRadius:
                          BorderRadius.circular(15),



                        ),



                      ),



                    ),



                  ),





                  SizedBox(
                    width:400,
                    child: Align(
                    
                    
                    
                      alignment:
                      Alignment.centerLeft,
                    
                    
                    
                      child:TextButton(
                    
                    
                    
                        onPressed:(){
                    
                    
                    
                          Navigator.push(
                    
                    
                    
                            context,
                    
                    
                    
                            MaterialPageRoute(
                    
                    
                    
                              builder:(context)=>
                              const ForgotPasswordPage(),
                    
                    
                    
                            ),
                    
                    
                    
                          );
                    
                    
                    
                        },
                    
                    
                    
                        child:
                        const Text(
                    
                    
                    
                          "Forgot Password?",
                    
                    
                    
                          style:TextStyle(
                    
                    
                    
                            color:Colors.white,
                    
                    
                            fontWeight:
                            FontWeight.bold,
                    
                    
                    
                          ),
                    
                    
                    
                        ),
                    
                    
                    
                      ),
                    
                    
                    
                    ),
                  ),






                  Text(



                    errorMessage,



                    style:
                    const TextStyle(



                      color:Colors.red,


                      fontWeight:
                      FontWeight.bold,



                    ),



                  ),






                  const SizedBox(height:20),





                  SizedBox(



                    width:400,


                    height:50,



                    child:ElevatedButton(



                      onPressed:login,



                      style:
                      ElevatedButton.styleFrom(



                        backgroundColor:
                        Colors.white,



                        shape:
                        RoundedRectangleBorder(



                          borderRadius:
                          BorderRadius.circular(15),



                        ),



                      ),





                      child:
                      const Text(



                        "Login",



                        style:TextStyle(



                          color:Colors.blueGrey,


                          fontSize:18,


                          fontWeight:
                          FontWeight.bold,



                        ),



                      ),



                    ),



                  ),





                  const SizedBox(height:20),






                  SizedBox(



                    width:400,


                    height:50,



                    child:
                    ElevatedButton.icon(



                      onPressed:
                      signInWithGoogle,



                      icon:
                      const Icon(



                        Icons.login,


                        color:Colors.black,



                      ),



                      label:
                      const Text(



                        "Sign in with Google",



                        style:TextStyle(



                          color:Colors.black,


                          fontSize:18,


                          fontWeight:
                          FontWeight.bold,



                        ),



                      ),





                      style:
                      ElevatedButton.styleFrom(



                        backgroundColor:
                        Colors.white,



                        shape:
                        RoundedRectangleBorder(



                          borderRadius:
                          BorderRadius.circular(15),



                        ),



                      ),



                    ),



                  ),





                  const SizedBox(height:20),






                  GestureDetector(



                    onTap:(){



                      Navigator.push(



                        context,



                        MaterialPageRoute(



                          builder:(context)=>
                          const SignupPage(),



                        ),



                      );



                    },



                    child:
                    const Text(



                      "Create New Account",



                      style:TextStyle(



                        color:Colors.white,


                        fontSize:16,


                        fontWeight:
                        FontWeight.bold,



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


}