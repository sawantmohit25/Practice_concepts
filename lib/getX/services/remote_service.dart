import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sembast_app/getX/models/employee_model.dart';
class NetworkService{

  Future<List<EmployeeModel>> getData()async{
    final url ='https://reqres.in/api/users?page=2';
    final response =await http.get(url);
    if(response.statusCode == 200){
      final data=jsonDecode(response.body);
      final Iterable json =data['data'];
      return json.map<EmployeeModel>((userData) => EmployeeModel.fromJson(userData)).toList();
    }
    else{
      throw Exception('unable to perform request');
    }
  }
}