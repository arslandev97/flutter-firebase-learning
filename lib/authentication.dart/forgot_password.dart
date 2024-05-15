
import 'package:email_auth/authentication.dart/components/components.dart';
import 'package:email_auth/authentication.dart/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  TextEditingController emailController = TextEditingController();

  // ignore: non_constant_identifier_names
  ForgotPassword(String email)async{

    if(email == ""){
      return UiHelper.customAlertBox(context, "Please Enter your email first and then click Forgot password Button. \nThank YOu!");
    }else{

      await UiHelper.customAlertBox(context, "Password Reset Email has been sended to your email address.Please check it.");
        
      FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen())));

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        title: const Text("Reset Password", style: TextStyle(color: Colors.white),),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          UiHelper.customTextFormField(
            controller: emailController,
            iconData: Icons.email,
            text: "Email",
            toHide: false,
          ),

          const SizedBox(height: 10.0,),

          UiHelper.customButton(
            () {
              ForgotPassword(emailController.text.toString());
            },
            "Reset Password"
          ),

        ],
      ),
    );
  }
}

