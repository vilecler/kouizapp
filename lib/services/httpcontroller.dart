import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kouizapp/constants/networking.dart';
import 'package:kouizapp/errors/networkexception.dart';
import 'package:kouizapp/models/httperror.dart';

Map<String, String> getHeaders(){
  return const <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };
}

Future<String> get(String path) async{
  Uri uri = Uri(scheme: 'https', host: Networking.apiDomainName, path: path,);
  http.Response response = await http.get(uri, headers: getHeaders(),);

  if (response.statusCode != 200){
    HttpError error = HttpError(code: response.statusCode, message: jsonDecode(response.body)['message']);
    throw NetworkException('Error GET status code is not 200.\nURL:$uri.\nStatusCode:${response.statusCode}', error);
  }
  return response.body;
}

Future<String> post(String path, String params) async{
  Uri uri = Uri(scheme: 'https', host: Networking.apiDomainName, path: path,);
  http.Response response = await http.post(uri, headers: getHeaders(), body: params);

  if (response.statusCode != 200){
    HttpError error = HttpError(code: response.statusCode, message: jsonDecode(response.body)['message']);
    throw NetworkException('Error POST status code is not 200.\nURL:$uri.\nStatusCode:${response.statusCode}', error);
  }
  return response.body;
}