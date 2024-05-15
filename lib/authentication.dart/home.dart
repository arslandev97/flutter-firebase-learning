

import 'package:email_auth/authentication.dart/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // ignore: non_constant_identifier_names
  Logout()async{
    FirebaseAuth.instance.signOut().then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        title: const Text("Home Screen", style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(onPressed: (){ Logout(); }, icon: const Icon(Icons.logout))
        ],

        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Column(
        children: [

        ],
      ),
    );
  }
}