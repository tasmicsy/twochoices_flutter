import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twochoices_flutter/Models/question.dart';

import 'Models/qtemp.dart';


class Setting extends StatelessWidget{
  String newQuestion = "";
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
        appBar: AppBar(title: Text("Setting"),
          actions: [
            TextButton(
                onPressed: (){
                  Provider.of<QTemp>(context, listen: false).changeValue(newQuestion, 2);
                  print(Provider.of<QTemp>(context, listen: false).qTemp.question);
                  Navigator.pop(context);
                },
                child: Text("Save",
                  style: TextStyle(color: Colors.white),))],
        ),
        body: Padding(
          padding: EdgeInsets.all(30),
          child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Please write down your question.", style: TextStyle(fontSize: 30),),
            Padding(padding: EdgeInsets.all(30),),
            TextField(
              autofocus: true,
              onChanged: (newText){
                newQuestion = newText;
              },
            ),
            Padding(padding: EdgeInsets.all(30),),
            ElevatedButton(
              child: Container(
                color: Colors.purple.shade300,
                  padding: const EdgeInsets.all(10),
                  child: Text("Save", style: TextStyle(fontSize: 30))

              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0),
              ),
              onPressed: () {
                if (newQuestion == ""){
                  print("hey");
                  //文章かケーってアラート入れたい
                }
                else {
                  Provider.of<QTemp>(context, listen: false).changeValue(
                      newQuestion, 2);
                  print(Provider.of<QTemp>(context, listen: false).qTemp.question);
                  //print(Provider.of<QTemp>(context, listen: false).qTemp.question);
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
        ),
    );
  }
}