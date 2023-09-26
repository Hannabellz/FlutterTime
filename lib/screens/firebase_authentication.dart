import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/screens/viewPersonalInfo.dart';
import 'package:untitled/userInfo.dart';

import 'insertInfoToDatabase.dart';
class FirebaseAuthentication extends StatefulWidget{
  @override
  _EditText createState() => _EditText();
}

class _EditText extends State<FirebaseAuthentication>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Login or Signup!"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email'
              ),
            ),
            TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password'
                ),
            ),
            ElevatedButton(
              onPressed:(){
                FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text, password: passwordController.text)
                    .then((value){
                  print("Successfully signed in");
                  setID(value.user?.uid);
                  setEmail(emailController.text);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                }).catchError((error){
                  print("Failed to sign in the user");
                  print(error.toString());
                });
              },
              child: Text("Login")
            ),
            ElevatedButton(
                onPressed:(){
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: emailController.text, password: passwordController.text)
                  .then((value){
                    print("Successfully signed up");
                    setID(value.user?.uid);
                    setEmail(emailController.text);
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddBasicInfo()));
                  }).catchError((error){
                    print("Failed to sign up the user");
                    print(error.toString());
                  });
                  },
                child: Text("Signup")
            )
          ]
        )
      )
    );
  }
}