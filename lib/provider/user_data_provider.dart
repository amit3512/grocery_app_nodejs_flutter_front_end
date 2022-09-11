import 'package:flutter/material.dart';
import 'package:grocery_app/ApiCalls/api_calls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataProvider extends ChangeNotifier {
  bool isAuthenticated = false;
  bool loading = false;
  bool? refresh;
  // List< UserModel>? data;
  Map<String, dynamic>? data;
  String? token;

  fetchUserData(dataApi, [refresh = false]) async {
    if (data == null || refresh == true) {
      loading = true;
      data = await ApiCalls().signIn(dataApi);
      if (data!["success"] == true) {
        isAuthenticated = true;
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString("login", data!["result"]["token"]);
        token = pref.getString("login");
      } else {
        isAuthenticated = false;
      }
      loading = false;
    }
    notifyListeners();
  }

  signOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
    data = null;
    token = pref.getString("login");
    isAuthenticated = false;
    notifyListeners();
  }
}
