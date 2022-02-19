import 'package:hive/hive.dart';

part 'question.g.dart';
    @HiveType(typeId: 1)
class Question {
      @HiveField(0)
      String question;

      @HiveField(1)
      int answer; //0: No, 1: Yes, 2: None
      Question({required this.question, required this.answer});

    }