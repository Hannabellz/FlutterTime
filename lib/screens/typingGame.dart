import 'dart:math';

import 'package:flutter/material.dart';
class TypeWhiz extends StatefulWidget {
  const TypeWhiz({super.key});

  @override
  State<TypeWhiz> createState() => _TypeWhizState();
}

class _TypeWhizState extends State<TypeWhiz> {
  TextEditingController gameController = TextEditingController();
  var word = "here";
  var encouragement = "";
  generateNewWord(){
    var possibleWords = ["hello", "morning", "typical", "evening", "afternoon", "oranges", "bananas","grapes",
    "enjoyment","chicken","lettuce","quizzical", "whimsical", "twelve","phenomenal","unstoppable"];
    word = possibleWords[Random.secure().nextInt(15)];
    encouragement = "";
    setState(() {

    });
  }
  incorrectType(){
    encouragement = "That's alright! You can do it. Try again!";
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your word is $word. $encouragement"),
            TextField(
              controller: gameController,
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Type your word!'
              ),
            ),
            ElevatedButton(
              onPressed:(){
                if (gameController.text == word){
                  generateNewWord();
                }
                else{
                  incorrectType();
                }
              },
              child: Text("Complete!")
            )
          ]
        )
      )
    );
  }
}
