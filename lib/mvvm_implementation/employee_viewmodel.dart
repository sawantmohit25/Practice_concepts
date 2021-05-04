import 'package:flutter/cupertino.dart';
import 'package:sembast_app/mvvm_implementation/employee_model.dart';
import 'package:sembast_app/mvvm_implementation/network_service.dart';

class EmployeeListViewModel extends ChangeNotifier{
  // List<EmployeeViewModel> employeeList = List<EmployeeViewModel>();
  List<EmployeeModel> employeeList=List<EmployeeModel>();

  NetworkService httpClient =NetworkService();

  Future<List<EmployeeModel>> fetchUsers() async{
    final results =await httpClient.getData();
    this.employeeList=results;
    notifyListeners();
    return results;
  }
}
