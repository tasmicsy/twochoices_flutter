
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Models/question.dart';
import 'main.dart';
class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  // final navigatorKey = GlobalKey<NavigatorState>();
  //
  // void show() {
  //   final context = navigatorKey.currentState!.overlay!.context;
  //   final dialog = AlertDialog(
  //     content: Text('Test'),
  //   );
  //   showDialog(context: context, builder: (x) => dialog);
  // }
List<String> sign = ["×", "○"];
List<String> yorn = ["No", "Yes"];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
          title: Text("Result"),
        actions: [TextButton(
            onPressed: (){

            },
            child: Icon(Icons.share, color: Colors.white,))],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(box.getAt(box.length -1).question, style: TextStyle(fontSize: 30),),
          Padding(
            padding: EdgeInsets.all(0),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(sign[box.getAt(box.length -1).answer], textAlign: TextAlign.center,style: TextStyle(fontSize: 200),),
              Text(yorn[box.getAt(box.length -1).answer], textAlign: TextAlign.center,style: TextStyle(fontSize: 100))
            ],
          ),
          Padding(
            padding: EdgeInsets.all(0),
          ),
          ElevatedButton(
            child: Text("Save in public", style: TextStyle(fontSize: 30)),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => CupertinoAlertDialog(
                  title: const Text('本当にシェアしますか？'),
                  content: const Text('OKを押すと、全てのユーザーがあなたの質問と結果を見ることができるようになります。この動作は取り消せません。よろしいですか？'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        //FireBaseに保存
                        Navigator.pop(context, 'OK');},
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
               // Navigator.pop(context);
              }

          ),
        ],
      ),
    );
  }
}
