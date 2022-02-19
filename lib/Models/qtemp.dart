import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:twochoices_flutter/Models/question.dart';

class QTemp extends ChangeNotifier{
  Question qTemp = Question(question: "", answer: 3); //0: No, 1: Yes, 2: q withoutAnswer, 3: No Question

  void changeValue(String newText, int answer){
    qTemp = Question(question: newText, answer: answer);
    notifyListeners();
  }

  String whichQuestion(BuildContext context, Box box) {
    if (qTemp.answer == 3) {
      if (box.isNotEmpty) {
        print("here1");
        return box
            .getAt(box.length - 1)
            .question;
      } else {
        print("here2");
        return "It will be sunny tomorrow.";

      }
    }
    else if (qTemp.answer == 2){
      print("here3");
      return qTemp.question;

    }
    else {
      return "Error occured. Prease let developer know by FAQ.";
    }
  }
}