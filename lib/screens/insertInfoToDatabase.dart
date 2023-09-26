import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:untitled/screens/viewPersonalInfo.dart';

import '../userInfo.dart';
class AddBasicInfo extends StatefulWidget {
  const AddBasicInfo({super.key});

  @override
  State<AddBasicInfo> createState() => _AddBasicInfoState();
}

class _AddBasicInfoState extends State<AddBasicInfo> {
  var favoriteColor = TextEditingController();
  var favoritePokemon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: favoriteColor,
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Favorite Color'
              ),
            ),
            TextField(
              controller: favoritePokemon,
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Favorite Pokemon'
              ),
            ),
            ElevatedButton(
              child: Text("Add Info"),
              onPressed: (){
                favoriteColor.text;
                favoritePokemon.text;

                FirebaseDatabase.instance.ref().child("favoriteColor/${getID()}").set(favoriteColor.text)
                .then((value){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                }).catchError((error){
                  print("failed to add. "+ error.toString());
                });
                FirebaseDatabase.instance.ref().child("favoritePokemon/${getID()}").set(favoritePokemon.text)
                    .then((value){

                }).catchError((error){
                  print("failed to add. "+ error.toString());
                });
              }
            )
          ]
        )
      )
    );
  }
}
