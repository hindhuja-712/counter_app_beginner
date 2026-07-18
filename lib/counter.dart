import 'dart:ui';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});
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
      if(counter > 0){
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
  Widget glassButton({
    required IconData icon,
    required VoidCallback onPressed,
  }
  )
  {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10,
          sigmaY: 10,
        ),
        child: Container(
          height:55,
          width:55,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: Colors.white.withOpacity(0.5),
              width:1.5,
            ),
          ),
          child: IconButton(
            onPressed:onPressed,
            icon: Icon(
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: const Text(
          "Counter App",
          style:TextStyle(
            color:Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation:0,
      ),
      extendBodyBehindAppBar:true,
      body: Container(
        width:double.infinity,
        height:double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
            "https://images.unsplash.com/photo-1499428665502-503f6c608263?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmxhY2slMjBhZXN0aGV0aWN8ZW58MHx8MHx8fDA%3D",
            ),
            fit:BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                  fontSize:20,
                  color:Colors.red,
                  fontWeight:FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment:MainAxisAlignment.end,
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