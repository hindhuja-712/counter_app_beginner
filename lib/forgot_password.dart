import 'package:flutter/material.dart';
import 'dart:ui';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  bool isNewPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(

        width: double.infinity,
        height: double.infinity,

        decoration: const BoxDecoration(

          image: DecorationImage(

            image: NetworkImage(
              "https://images.unsplash.com/vector-1783428892437-0c7af1f43132?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxpbGx1c3RyYXRpb25zLWZlZWR8NHx8fGVufDB8fHx8fA%3D%3D",
            ),

            fit: BoxFit.cover,

          ),

        ),


        child: Center(

          child: ClipRRect(

            borderRadius: BorderRadius.circular(20),

            child: BackdropFilter(

              filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10,
              ),


              child: Container(

                width: 500,
                height: 500,


                decoration: BoxDecoration(

                  color: Colors.white.withOpacity(0.2),

                  borderRadius: BorderRadius.circular(20),

                  border: Border.all(

                    color: Colors.white.withOpacity(0.3),

                    width: 1.5,

                  ),

                ),


                child: Padding(

                  padding: const EdgeInsets.all(20),

                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,


                    children: [


                      const Text(

                        "Forgot Password",

                        style: TextStyle(

                          fontSize: 28,

                          fontWeight: FontWeight.bold,

                          color: Colors.black87,

                        ),

                      ),


                      const SizedBox(height: 30),



                      // Email Field

                      SizedBox(

                        width: 280,

                        height: 50,

                        child: TextField(

                          decoration: InputDecoration(

                            hintText: "Enter your Email",

                            prefixIcon: const Icon(Icons.email),

                            filled: true,

                            fillColor: Colors.white,


                            border: OutlineInputBorder(

                              borderRadius: BorderRadius.circular(15),

                            ),

                          ),

                        ),

                      ),



                      const SizedBox(height: 30),



                      // New Password Field

                      SizedBox(

                        width: 280,

                        height: 50,


                        child: TextField(

                          obscureText: isNewPasswordHidden,


                          decoration: InputDecoration(

                            hintText: "New Password",

                            prefixIcon: const Icon(Icons.lock),


                            suffixIcon: IconButton(

                              icon: Icon(

                                isNewPasswordHidden

                                    ? Icons.visibility_off

                                    : Icons.visibility,

                              ),


                              onPressed: () {

                                setState(() {

                                  isNewPasswordHidden =
                                      !isNewPasswordHidden;

                                });

                              },

                            ),


                            filled: true,

                            fillColor: Colors.white,


                            border: OutlineInputBorder(

                              borderRadius: BorderRadius.circular(15),

                            ),

                          ),

                        ),

                      ),



                      const SizedBox(height: 30),



                      // Confirm Password Field

                      SizedBox(

                        width: 280,

                        height: 50,


                        child: TextField(

                          obscureText: isConfirmPasswordHidden,


                          decoration: InputDecoration(


                            hintText: "Confirm Password",


                            prefixIcon: const Icon(Icons.lock),



                            suffixIcon: IconButton(

                              icon: Icon(

                                isConfirmPasswordHidden

                                    ? Icons.visibility_off

                                    : Icons.visibility,

                              ),


                              onPressed: () {

                                setState(() {

                                  isConfirmPasswordHidden =
                                      !isConfirmPasswordHidden;

                                });

                              },

                            ),


                            filled: true,

                            fillColor: Colors.white,


                            border: OutlineInputBorder(

                              borderRadius: BorderRadius.circular(15),

                            ),

                          ),

                        ),

                      ),



                      const SizedBox(height: 30),



                      // Button

                      SizedBox(

                        width: 280,

                        height: 50,


                        child: ElevatedButton(


                          onPressed: () {},


                          style: ElevatedButton.styleFrom(

                            backgroundColor: Colors.white,

                            foregroundColor: Colors.black,


                            shape: RoundedRectangleBorder(

                              borderRadius: BorderRadius.circular(15),

                            ),

                          ),


                          child: const Text(

                            "Reset Password",

                            style: TextStyle(

                              fontSize: 18,

                              fontWeight: FontWeight.bold,

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