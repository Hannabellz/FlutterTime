import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:untitled/screens/typingGame.dart';

import '../userInfo.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //load personal info from database to display
  var favoriteColor = "";
  var favoritePokemon = "";
  var initial = true;
  callMeColor(){
    FirebaseDatabase.instance.ref().child("favoriteColor/${getID()}").once()
        .then((value){
          favoriteColor = value.snapshot.value.toString();
          print(favoriteColor);
          initial = false;
          setState(() {
          });
        //return value.snapshot.value.toString();
    }).catchError((error){
      print(error);
      //return error;
    });
  }
  callMePokemon(){
    FirebaseDatabase.instance.ref().child("favoritePokemon/${getID()}").once()
        .then((value){
          favoritePokemon = value.snapshot.value.toString();
          initial = false;
          setState(() {
          });
      //return value.snapshot.value.toString();
    }).catchError((error){
      print(error);
      //return error;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(initial) {
      callMePokemon();
      callMeColor();
    }
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Hello, ${getEmail()}. I hope you're having a good day!"),
             Text("Your favorite color is ${favoriteColor}"),
        Text("and your favorite Pokemon is ${favoritePokemon}"),
            ElevatedButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TypeWhiz()));
            }, child: Text("Go to Typing Game!"))
          ]
        )
      )
    );
  }
}
