import 'package:flutter/material.dart';
import 'package:grocery_app/ApiCalls/api_calls.dart';
import '../models/productModel.dart';
import 'package:grocery_app/models/productModel.dart';

class CategoryDataProvider extends ChangeNotifier {
  bool loading = false;
  bool? refresh;
  int count = 100;

  List<ProductModel>? data;
  fetchProductData([refresh = false])  async{
    if (data == null || refresh == true) {
      loading = true;
      data = await ApiCalls().fetchProducts() ;
      loading = false;
    }
    notifyListeners();
  }
}


