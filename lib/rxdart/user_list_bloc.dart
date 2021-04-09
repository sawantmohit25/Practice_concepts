import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sembast_app/model_class/usermodel.dart';
import 'package:http/http.dart' as http;

class UserListBloc{
  // Dio dio =Dio();
  List<UserModel> users = List();
  // BehaviorSubject<List<UserModel>> subjectUser =BehaviorSubject<List<UserModel>>() ;

final BehaviorSubject<List<UserModel>> subjectUser = BehaviorSubject <List<UserModel>>();
   getData() async {
    final response = await http.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      users=data.map<UserModel>((data) => UserModel.fromJson(data)).toList();
      subjectUser.add(users);
    } else {
      print("Error in URL");
    }
  }
  void dispose(){
    subjectUser.close();
  }
}