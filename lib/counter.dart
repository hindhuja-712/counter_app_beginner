import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';

class CounterPage extends StatefulWidget {
  final String username;

  const CounterPage({
    super.key,
    required this.username,
  });

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {

  int counter = 0;
  String message = "";

  void incrementCounter(){
    setState(() {
      counter++;
      message="";
    });
  }

  void decrementCounter(){
    setState(() {
      if(counter>0){
        counter--;
        message="";
      }
      else{
        message="Invalid Input";
      }
    });
  }

  void resetCounter(){
    setState(() {
      counter=0;
      message="";
    });
  }


  Future<void> logout() async {

    await FirebaseAuth.instance.signOut();

    if(mounted){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder:(context)=>const LoginPage(),
        ),
      );
    }
  }


  Widget glassButton({
    required IconData icon,
    required VoidCallback onPressed,
  }){

    return ClipRRect(
      borderRadius:BorderRadius.circular(50),
      child:BackdropFilter(
        filter:ImageFilter.blur(
          sigmaX:10,
          sigmaY:10,
        ),
        child:Container(
          height:55,
          width:55,
          decoration:BoxDecoration(
            color:Colors.white.withOpacity(0.2),
            borderRadius:
            BorderRadius.circular(50),
            border:Border.all(
              color:Colors.white.withOpacity(0.5),
              width:1.5,
            ),
          ),
          child:IconButton(
            onPressed:onPressed,
            icon:Icon(
              icon,
              color:Colors.white,
              size:28,
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar:AppBar(
        title:Text(
          "Welcome ${widget.username}",
          style:const TextStyle(
            color:Colors.white,
          ),
        ),

        backgroundColor:Colors.transparent,
        elevation:0,

        actions:[
          IconButton(
            onPressed:logout,
            icon:const Icon(
              Icons.logout,
              color:Colors.white,
            ),
          ),
        ],
      ),

      extendBodyBehindAppBar:true,

      body:Container(
        width:double.infinity,
        height:double.infinity,

        decoration:const BoxDecoration(
          image:DecorationImage(
            image:NetworkImage(
              "https://images.unsplash.com/photo-1586105538956-f0fc8ec7887a?w=700&auto=format&fit=crop&q=60",
            ),
            fit:BoxFit.cover,
          ),
        ),

        child:Center(
          child:Column(
            mainAxisAlignment:
            MainAxisAlignment.center,

            children:[

              Text(
                "$counter",
                style:const TextStyle(
                  fontSize:60,
                  fontWeight:FontWeight.bold,
                  color:Colors.white,
                ),
              ),

              const SizedBox(height:20),

              Text(
                message,
                style:const TextStyle(
                  color:Colors.red,
                  fontSize:20,
                  fontWeight:FontWeight.bold,
                ),
              ),

            ],
          ),
        ),
      ),


      floatingActionButton:Row(
        mainAxisAlignment:
        MainAxisAlignment.end,

        children:[

          glassButton(
            icon:Icons.remove,
            onPressed:decrementCounter,
          ),

          const SizedBox(width:10),

          glassButton(
            icon:Icons.add,
            onPressed:incrementCounter,
          ),

          const SizedBox(width:10),

          glassButton(
            icon:Icons.refresh,
            onPressed:resetCounter,
          ),

        ],
      ),

    );
  }
}