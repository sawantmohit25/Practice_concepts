import 'package:get/get.dart';
import 'package:sembast_app/getX/models/employee_model.dart';
import 'package:sembast_app/getX/services/remote_service.dart';

class EmployeeController extends GetxController{
  var employeeList=List<EmployeeModel>().obs;
  var isLoading=true.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData()async{
    try{
      isLoading(true);
      var employees=await NetworkService().getData();
      if(employees!=null){
        employeeList.value=employees;
      }
    }finally{
      isLoading(false);
    }
  }
}