import 'dart:async';
import 'dart:ui';

import 'package:email_auth/authentication.dart/home.dart';
import 'package:email_auth/authentication.dart/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  // ignore: non_constant_identifier_names
  Future CheckUser()async{

    final user = FirebaseAuth.instance.currentUser;

    if(user != null){
      Timer(const Duration(seconds: 5), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
      });
    }else{
       Timer(const Duration(seconds: 5), () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
      });
    }

  }

  @override
  void initState() {
    super.initState();
    CheckUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/firebase.png"),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10.0,
                sigmaY: 10.0,
              ),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),

            Text("Flutter Firebase \nLearning", textAlign: TextAlign.center, style: GoogleFonts.yellowtail(
              textStyle: const TextStyle(
                  fontSize: 46.0,
                  fontWeight: FontWeight.bold,
                  height: 1.0,
                ),
            ),),

            const SizedBox(height: 20.0,),

            const SpinKitWaveSpinner(
              size: 150.0,
              color: Colors.deepPurple,
              duration: Duration(seconds: 6),
            ),

          ],
        ),
      ),
    );
  }
}