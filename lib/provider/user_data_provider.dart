import 'package:flutter/material.dart';
import 'package:grocery_app/ApiCalls/api_calls.dart';
import 'package:grocery_app/models/userModel.dart';
import '../models/productModel.dart';
import 'package:grocery_app/models/productModel.dart';

class UserDataProvider extends ChangeNotifier {
  bool isAuthenticated = false;
  bool loading = false;
  bool? refresh;
  // List< UserModel>? data;
  Map<String, dynamic>? data;

  fetchUserData(dataApi, [refresh = false]) async {
    if (data == null || refresh == true) {
      loading = true;
      data = await ApiCalls().signIn(dataApi);

      if (data!["success"] == true) {
        isAuthenticated = true;
      }
      // print(_isAuthentificated);
      loading = false;
    }
    notifyListeners();
  }
}
