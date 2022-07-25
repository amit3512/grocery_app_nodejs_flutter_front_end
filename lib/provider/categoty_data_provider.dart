import 'package:flutter/material.dart';
import 'package:grocery_app/ApiCalls/api_calls.dart';

import '../models/employee_model.dart';
import '../models/productModel.dart';

class CategoryDataProvider extends ChangeNotifier{
  bool loading=false;
  bool? refresh;
  // EmployeeModel? data;
  List<ProductModel>? data;
  fetchdata([ refresh = false] )async{
    if(data == null || refresh == true){
      loading = true;
      data =await ApiCalls().fetchProducts();
      loading = false;
      notifyListeners();
    }
  }
  // fetchdata([ refresh = false] )async{
  //   if(data == null || refresh == true){
  //     loading = true;
  //     data =await ApiCalls().fetchEmployee();
  //     loading = false;
  //     notifyListeners();
  //   }
  // }
}

