import 'package:flutter/material.dart';

class UiHelper{

  static customTextFormField({required TextEditingController controller, required String text, required IconData iconData, required bool toHide}){

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: TextField(
        controller: controller,
        obscureText: toHide,
        decoration: InputDecoration(
          hintText: text,
          suffixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0)
          )
        ),
      ),
    );

  }


  static customButton(VoidCallback callback, String text){
    return SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
        ),
        onPressed: (){
          callback();
        }, 
        child: Text(text, style: const TextStyle(color: Colors.white),),
      ),
    );
  }


  static customAlertBox(BuildContext context, String text){
    return showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(text, textAlign: TextAlign.center, style: const TextStyle(
            fontSize: 14.0,
          ),),
          actions: [
            TextButton(onPressed: (){Navigator.pop(context);}, child: const Text("Ok"))
          ],
        );
      },
    );
  }


}