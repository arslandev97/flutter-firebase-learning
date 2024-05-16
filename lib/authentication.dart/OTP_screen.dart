
import 'dart:math';

import 'package:email_auth/authentication.dart/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OPTScreen extends StatefulWidget {
  String verificationId;
  OPTScreen({super.key, required this.verificationId});

  @override
  State<OPTScreen> createState() => _OPTScreenState();
}

class _OPTScreenState extends State<OPTScreen> {
  
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
        title: const Text("OTP Screen", style: TextStyle(color: Colors.white),),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: TextField(
              controller: otpController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Enter The OPT",
                suffixIcon: const Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                )
              ),
            ),
          ),

          const SizedBox(height: 30,),

          ElevatedButton(
            onPressed: () async {
              try{
                PhoneAuthCredential credential = await PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode: otpController.text.toString());
                FirebaseAuth.instance.signInWithCredential(credential).then((value){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                });
              }catch(ex){
                log(ex.toString() as num);
              }
            },
            child: const Text("Verify OTP"),
          ),

        ],
      ),
    );
  }
}

