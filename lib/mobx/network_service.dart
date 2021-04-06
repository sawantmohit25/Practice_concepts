import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sembast_app/model_class/usermodel.dart';

/// Here we get the response from API
class NetworkService {
  List<UserModel> users = List();

  Future getData(String url) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      users=data.map<UserModel>((data) => UserModel.fromJson(data)).toList();
      return users;
    } else {
      print("Error in URL");
    }
  }

}
