import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:ui';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() =>
      _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final TextEditingController emailController =
      TextEditingController();

  String message = "";

  Future<void> resetPassword() async {

    String email = emailController.text.trim();

    try {

      await FirebaseAuth.instance
          .sendPasswordResetEmail(
        email: email,
      );

      setState(() {

        message =
            "Password reset link sent to your email";

      });

    } on FirebaseAuthException catch(e){

      setState(() {

        message =
            e.message ?? "Error occurred";

      });

    }

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(

        width: double.infinity,
        height: double.infinity,

        decoration: const BoxDecoration(

          image: DecorationImage(

            image: NetworkImage(
              "https://images.unsplash.com/photo-1458929526027-052f5d6a3c5e?q=80&w=870&auto=format&fit=crop",
            ),

            fit: BoxFit.cover,

          ),

        ),


        child: Center(

          child: ClipRRect(

            borderRadius:
            BorderRadius.circular(20),


            child: BackdropFilter(

              filter: ImageFilter.blur(
                sigmaX:10,
                sigmaY:10,
              ),


              child: Container(

                width:400,
                height:350,


                decoration:BoxDecoration(

                  color:
                  Colors.white.withOpacity(0.25),


                  borderRadius:
                  BorderRadius.circular(20),


                  border:Border.all(

                    color:
                    Colors.white.withOpacity(0.3),

                  ),

                ),


                child:Padding(

                  padding:
                  const EdgeInsets.all(25),


                  child:Column(

                    mainAxisAlignment:
                    MainAxisAlignment.center,


                    children:[


                      const Text(

                        "Forgot Password",

                        style:TextStyle(

                          fontSize:28,

                          fontWeight:
                          FontWeight.bold,

                          color:
                          Colors.black87,

                        ),

                      ),



                      const SizedBox(height:30),



                      SizedBox(

                        width:300,

                        height:50,


                        child:TextField(

                          controller:
                          emailController,


                          decoration:InputDecoration(

                            hintText:
                            "Enter your Email",


                            prefixIcon:
                            const Icon(
                              Icons.email,
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



                      const SizedBox(height:20),



                      Text(

                        message,

                        textAlign:
                        TextAlign.center,


                        style:
                        const TextStyle(

                          color:
                          Colors.red,

                          fontWeight:
                          FontWeight.bold,

                        ),

                      ),



                      const SizedBox(height:20),



                      SizedBox(

                        width:300,

                        height:50,


                        child:ElevatedButton(

                          onPressed:
                          resetPassword,


                          style:
                          ElevatedButton.styleFrom(

                            backgroundColor:
                            Colors.white,


                            foregroundColor:
                            Colors.black,


                            shape:
                            RoundedRectangleBorder(

                              borderRadius:
                              BorderRadius.circular(15),

                            ),

                          ),


                          child:
                          const Text(

                            "Send Reset Link",

                            style:TextStyle(

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

        ),

      ),

    );

  }

}