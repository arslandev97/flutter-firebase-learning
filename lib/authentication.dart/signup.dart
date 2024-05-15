
// ignore_for_file: unused_local_variable

import 'package:email_auth/authentication.dart/components/components.dart';
import 'package:email_auth/authentication.dart/home.dart';
import 'package:email_auth/authentication.dart/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // ignore: non_constant_identifier_names
  Signup(String email, String password)async{
    if(email == "" && password == ""){
      UiHelper.customAlertBox(context, "Please Enter the email and password first then click signup");
    }else{
      
      UserCredential? userCredential;
      
      try{
        userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeScreen())));
      }
      on FirebaseAuthException catch(ex){
        return UiHelper.customAlertBox(
          // ignore: use_build_context_synchronously
          context, 
          ex.code.toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        title: const Text("Signup Screen", style: TextStyle(color: Colors.white),),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          UiHelper.customTextFormField(
            controller: emailController,
            text: "Email",
            iconData: Icons.email,
            toHide: false,
          ),

          UiHelper.customTextFormField(
            controller: passwordController,
            text: "Password",
            iconData: Icons.lock,
            toHide: true,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 InkWell(
                  onTap: (){
                    
                  },
                  child: const Text("Forgot Password?", style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),),
                )
              ],
            ),
          ),

          const SizedBox(height: 20,),

          UiHelper.customButton(
            (){
              Signup(emailController.text.toString(), passwordController.text.toString());
            },
            "SignUp"
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an Account"),
              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
                }, 
                child: const Text("Login", style: TextStyle(
                color: Colors.black87,
                decoration: TextDecoration.underline,
              ),))
            ],
          ),

        ],
      ),
    );
  }
}