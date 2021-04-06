import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sembast_app/model_class/usermodel.dart';
/// Here we get the API response and notify the listeners when value gets updated
class ProviderResponse extends ChangeNotifier{
  List<UserModel> users = List();

  Future getData(String url) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      users=data.map<UserModel>((data) => UserModel.fromJson(data)).toList();
      notifyListeners();// should be given before returning any value
      return users;
    } else {
      print("Error in URL");
    }
  }
}