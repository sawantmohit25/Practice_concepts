import 'dart:convert';

import 'package:scoped_model/scoped_model.dart';
import 'package:sembast_app/scoped_model/scoped_employeemodel.dart';
import 'package:http/http.dart' as http;

class ScopedDetails extends Model{
  List<EmployeeModel> scopedModel =List();
     getData()async{
    final url ='https://reqres.in/api/users?page=2';
    final response =await http.get(url);
    if(response.statusCode == 200){
      final data=jsonDecode(response.body);
      final Iterable json =data['data'];
      scopedModel=json.map<EmployeeModel>((userData) => EmployeeModel.fromJson(userData)).toList();
      notifyListeners();
    }
    else{
      throw Exception('unable to perform request');
    }
  }
}