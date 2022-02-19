import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:styled_text/styled_text.dart';
import 'package:twochoices_flutter/Models/qtemp.dart';
import 'package:twochoices_flutter/main.dart';
import 'package:twochoices_flutter/result.dart';
import 'package:twochoices_flutter/setting.dart';
import 'Info.dart';
import 'Models/question.dart';

class Home extends StatelessWidget{
  Random random = new Random();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Two Choices"),
        leading: TextButton(onPressed: (){
          Navigator.push(context, SlideRightRoute(page: Info()));
        }, child: Icon(Icons.info, color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(children: [ElevatedButton(
              child: Container(
                color: Colors.purple.shade200,
                padding: const EdgeInsets.all(10),
                child: const Text('Change Question →',
                style: TextStyle(fontSize: 20),),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Setting()));
              },
            ),
            Text(Provider.of<QTemp>(context).whichQuestion(context, box),
            style: TextStyle(fontSize: 40),textAlign: TextAlign.center),]),
            ElevatedButton(
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Colors.purple[300]!,
                      Colors.purple[500]!,
                      Colors.purple[700]!,
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(10),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(child: Image.asset('images/icon.png'),
                    width: 30),
                    Text("占う", style: TextStyle(fontSize: 30)),
                  ],
                )

              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0),
              ),
              onPressed: () {
                box.add(Question(question: Provider.of<QTemp>(context, listen: false).whichQuestion(context, box),answer: random.nextInt(2)));
                Navigator.push(context, MaterialPageRoute(builder: (context) => Result()));
              },
            ),],
        ),
      ),
    );
  }
}

// String whichQuestion(BuildContext context) {
//   if (Provider.of<QTemp>(context,listen: false).qTemp.answer == 3) {
//     if (box.isNotEmpty) {
//       print("here1");
//       return box
//           .getAt(box.length - 1)
//           .question;
//     } else {
//       print("here2");
//       return "It will be sunny tomorrow.";
//
//     }
//   }
//     else if (Provider.of<QTemp>(context,listen: false).qTemp.answer == 2){
//       print("here3");
//       return Provider.of<QTemp>(context,listen: false).qTemp.question;
//
//   }
//   else {
//     return "Error occured. Prease let developer know by FAQ.";
//   }
// }