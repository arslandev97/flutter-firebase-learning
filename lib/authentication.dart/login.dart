
import 'package:email_auth/authentication.dart/components/components.dart';
import 'package:email_auth/authentication.dart/forgot_password.dart';
import 'package:email_auth/authentication.dart/home.dart';
import 'package:email_auth/authentication.dart/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // ignore: non_constant_identifier_names
  Login(String email, String password) async {

    if(email == "" && password == ""){
      UiHelper.customAlertBox(context, "PLease enter your email and password then click login Button!");
    }else{
      // ignore: unused_local_variable
      UserCredential? userCredential;

      try{
         userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeScreen())));
      }
      on FirebaseAuthException catch(ex){
        // ignore: use_build_context_synchronously
        return UiHelper.customAlertBox(context, ex.code.toString());
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        title: const Text("Login Screen", style: TextStyle(color: Colors.white),),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const ForgotPassword()));
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
              Login(
                emailController.text.toString(), 
                passwordController.text.toString());
            },
            "Login"
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an Account"),
              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUpScreen()));
                }, 
                child: const Text("Signup", style: TextStyle(
                color: Colors.black87,
                decoration: TextDecoration.underline,
              ),))
            ],
          )
        ],
      ),
    );
  }
}
