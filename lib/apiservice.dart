import 'dart:convert';
import 'package:flutter3/classdata.dart';
import 'package:http/http.dart' as http;

class Service{
  Future<List<Data>> getAlldata() async{
    final response = await http.get(
        Uri.parse('https://6283762138279cef71d77f41.mockapi.io/api/v1/data2')
    );
    if (response.statusCode ==200){
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((cdata)=> Data.fromJson(cdata)).toList();

    }else {
      throw Exception('Failed to load Data');
    }
  }
}