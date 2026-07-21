import 'package:flutter/material.dart';
import 'dart:ui';
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
    bool isNewPasswordHidden=true;
    bool isConfirmPasswordHidden=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container( 
            height:double.infinity,
            width:double.infinity,

            decoration: const BoxDecoration(
                image:DecorationImage(image: NetworkImage(
                    "https://images.unsplash.com/photo-1784166011505-bcc375c53aa3?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDJ8Ym84alFLVGFFMFl8fGVufDB8fHx8fA%3D%3D",
                ),
                fit:BoxFit.cover,
                ),
            ),
            child:Center(child: 
            ClipRRect( 
                borderRadius: BorderRadius.circular(20),

                child:BackdropFilter( 
                    filter:ImageFilter.blur(  
                        sigmaX:10,
                        sigmaY:10,
                    ),
                    child:Container( 
                        width:500,
                        height:500,

                        decoration: BoxDecoration(color: 
                        Colors.white.withOpacity(0.2),
                        borderRadius:BorderRadius.circular(20),

                        border:Border.all( 
                            color:Colors.white.withOpacity(0.3),
                            width:1.5,
                        ),
                        ),
                        child:Column( 
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[ 
                                const Text(
                                "Create Account",
                                style:TextStyle( 
                                    fontSize:30,
                                    fontWeight:FontWeight.bold,
                                    color:Colors.white,
                                ),
                                ),
                                const SizedBox(height:20),

                                SizedBox(
                                    width:300,
                                    height:50,
                                        child:TextField(
                                            decoration: InputDecoration(
                                                hintText:"Full Name",
                                                prefixIcon: const Icon(Icons.person),
                                                filled:true,
                                                fillColor:Colors.white,    
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(20),
                                                ) ,                 
                                            ),
                                        ),
                                    ),
                                    const SizedBox(height:20),

                                    SizedBox( 
                                        width:300,
                                        height:50,
                                        child:TextField( 
                                            decoration: InputDecoration(
                                                hintText:"Enter Your Enail Address",
                                                prefixIcon:const Icon(Icons.email),
                                                filled:true,
                                                fillColor:Colors.white,
                                                border:OutlineInputBorder( 
                                                    borderRadius: BorderRadius.circular(20),
                                                ),
                                            ),
                                        ),
                                    ),
                                    const SizedBox(height:20),
                                    SizedBox(  
                                        width:300,
                                        height:50,
                                        child:TextField(
                                            obscureText: isNewPasswordHidden,  
                                            decoration: InputDecoration(
                                                hintText: "New Password",
                                                prefixIcon: const Icon(Icons.lock),
                                                suffixIcon:IconButton(
                                                    icon:Icon(
                                                        isNewPasswordHidden?Icons.visibility_off:Icons.visibility,
                                                    ),
                                                    onPressed:(){
                                                        setState(() {
                                                          isNewPasswordHidden=!isNewPasswordHidden;
                                                        });
                                                    }
                                                ),
                                                filled:true,
                                                fillColor: Colors.white,
                                                border:OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(20),
                                                )
                                            ),
                                        ),
                                    ),
                                    const SizedBox(height:20),
                                    SizedBox(  
                                        width:300,
                                        height:50,
                                        child:TextField( 
                                            obscureText: isConfirmPasswordHidden, 
                                            decoration: InputDecoration(
                                                hintText: "Confirm Password",
                                                prefixIcon: const Icon(Icons.lock),

                                                suffixIcon: IconButton( 
                                                    icon:Icon(
                                                        isConfirmPasswordHidden?Icons.visibility_off:Icons.visibility,
                                                    ),
                                                    onPressed: (){
                                                        setState(() {
                                                          isConfirmPasswordHidden=!isConfirmPasswordHidden;
                                                        });
                                                    },
                                                ),
                                                filled:true,
                                                fillColor: Colors.white,
                                                border:OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(20),
                                                ),
                                            ),
                                        ),
                                    ),
                                    const SizedBox(height:20),
                                    SizedBox(
                                        width:300,
                                        height:50,
                                        child:ElevatedButton(onPressed:(){

                                        },
                                        style:ElevatedButton.styleFrom(
                                            backgroundColor:Colors.white,
                                            shape:RoundedRectangleBorder(
                                                borderRadius: BorderRadiusGeometry.circular(20),
                                            ),
                                        ),
                                        child:const Text(
                                            "Sign Up",
                                            style:TextStyle(
                                                fontSize:18,
                                                color:Colors.black87,
                                                fontWeight: FontWeight.bold,)
                                            )
                                        )
                                        ),
                                        const SizedBox(height:20),

                                   GestureDetector(
                                       onTap: (){
                                        Navigator.pop(context);
                                        },
                                    child: const Text(
                                    "Already have an account? Login",
                                    style: TextStyle(
                                    color: Colors.white,
                                    fontSize:16,
                                    fontWeight: FontWeight.bold,
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
        );
  }
}