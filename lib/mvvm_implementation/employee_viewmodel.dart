import 'package:flutter/cupertino.dart';
import 'package:sembast_app/mvvm_implementation/employee_model.dart';
import 'package:sembast_app/mvvm_implementation/network_service.dart';

class EmployeeListViewModel extends ChangeNotifier{
  List<EmployeeViewModel> employeeList = List<EmployeeViewModel>();

  NetworkService httpClient =NetworkService();

  Future fetchUsers() async{
    final results =await httpClient.getData();
    this.employeeList=results.map((item) => EmployeeViewModel(employee: item)).toList();
    print(employeeList);
    notifyListeners();
  }
}
class EmployeeViewModel {

  final EmployeeModel employee;

  EmployeeViewModel({this.employee});

  String get firstName {
    return this.employee.firstName;
  }

  String get lastName {
    return this.employee.lastName;
  }
  String get email {
    return this.employee.email;
  }
  String get id {
    return this.employee.id.toString();
  }
  String get avatar {
    return this.employee.avatar;
  }
}
