import 'dart:convert';

import 'package:kouizapp/services/httpcontroller.dart' as http;

import '../models/theme.dart';


Future<List<Theme>> fetchThemes(String category) async{
  try{
    final responseBody = await http.get('/themes/' + category + '/category');
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Theme>((themeJson) => Theme.fromJson(themeJson)).toList();
  } catch (e){
    print(e);
    rethrow;
  }
}

