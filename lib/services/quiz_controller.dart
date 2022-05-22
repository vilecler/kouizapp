import 'dart:convert';

import 'package:kouizapp/services/httpcontroller.dart' as http;

import '../models/quiz.dart';


Future<List<Quiz>> fetchQuizzes(String theme) async{
  try{
    final responseBody = await http.get('/quizzes/' + theme + '/theme');
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    List<Quiz> allQuizzes =  parsed.map<Quiz>((quizJson) => Quiz.fromJson(quizJson)).toList();

    //Filter quiz with same code
    List<String> codes = [];
    return allQuizzes.where((element){
      if(!codes.contains(element.code)){
        codes.add(element.code);
        return true;
      }
      return false;
    }).toList();
  } catch (e){
    print(e);
    rethrow;
  }
}

