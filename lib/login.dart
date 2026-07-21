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

  // Controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String errorMessage = "";

  // Firebase Login Function
  Future<void> login() async {

    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    try {

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: username,
        password: password,
      );


      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const CounterPage(),
        ),
      );
    } on FirebaseAuthException catch(e) {
      setState(() {
        errorMessage = e.message ?? "Login Failed";
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
              "https://images.unsplash.com/photo-1682447278584-aeddb64620ce?w=700&auto=format&fit=crop&q=60",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Username

                  SizedBox(

                    width:400,
                    height:50,

                    child: TextField(

                      controller: usernameController,

                      decoration: InputDecoration(

                        hintText:"Username",

                        prefixIcon: const Icon(Icons.person),

                        filled:true,

                        fillColor:Colors.white,


                        border:OutlineInputBorder(

                          borderRadius:BorderRadius.circular(15),

                        ),

                      ),

                    ),

                  ),



                  const SizedBox(height:20),


                  // Password
                  SizedBox(
                    width:400,
                    height:50,
                    child:TextField(
                      controller:passwordController,
                      obscureText:true,
                      decoration:InputDecoration(
                        hintText:"Password",
                        prefixIcon:const Icon(Icons.lock),
                        filled:true,
                        fillColor:Colors.white,
                        border:OutlineInputBorder(
                          borderRadius:BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height:20),
                  // Forgot Password
                  SizedBox(
                    width:400,
                    child:Align(
                      alignment:Alignment.centerLeft,
                      child:TextButton(
                        onPressed:(){
                          Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordPage(),
                          ),
                          );
                        },
                        child:const Text(
                          "Forgot Password?",
                          style:TextStyle(
                            color:Colors.white,
                            fontWeight:FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Error Message
                  Text(
                    errorMessage,
                    style:const TextStyle(
                      color:Colors.red,
                      fontSize:16,
                      fontWeight:FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height:20),
                  SizedBox(
                    width:400,
                    height:50,
                    child:ElevatedButton(
                      onPressed:login,
                      style:ElevatedButton.styleFrom(
                        backgroundColor:Colors.white,
                        foregroundColor:Colors.white,


                        shape:RoundedRectangleBorder(

                          borderRadius:BorderRadius.circular(15),

                        ),

                      ),
                      child:const Text(

                        "Login",

                        style:TextStyle(

                          fontSize:18,

                          fontWeight:FontWeight.bold,
                          color:Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height:20),

GestureDetector(
  onTap: (){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context)=> const SignupPage(),
      ),
    );
  },
  child: const Text(
    "Create New Account",
    style: TextStyle(
      color: Colors.white,
      fontSize: 16,
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

    );

  }

}