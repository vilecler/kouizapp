import 'dart:convert';

import 'package:kouizapp/errors/networkexception.dart';
import 'package:kouizapp/services/httpcontroller.dart' as http;

import '../models/category.dart';


Future<List<Category>> fetchCategories() async{
  try{
    final responseBody = await http.get('/categories');
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Category>((categoryJson) => Category.fromJson(categoryJson)).toList();
  } on NetworkException catch (e){
    rethrow;
  } catch (e){
    rethrow;
  }
}

