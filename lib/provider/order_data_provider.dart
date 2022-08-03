import 'package:flutter/material.dart';
import 'package:grocery_app/ApiCalls/api_calls.dart';
import '../models/orderModel.dart';

class OrderDataProvider extends ChangeNotifier {
  bool loading = false;
  bool? refresh;
  // final int _counter = 0;
  // int get counter => _counter;
  final double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;
  int counter = 0;

  List<OrderModel>? data;
  fetchData([refresh = false]) async {
    if (data == null || refresh == true) {
      loading = true;
      data = await ApiCalls().fetchOrder();
      loading = false;
      notifyListeners();
    }
  }

  List<OrderModel> lst = <OrderModel>[];
  add(Map<String, dynamic> orderDetails) {
    // var existingItem = lst.firstWhere(
    //     (itemToCheck) => itemToCheck.productId == orderDetails["productId"]);
    var index = lst.indexWhere(
        (element) => element.productId == orderDetails["productId"]);

    if (index != -1) {
      int? county = lst[index].quantity ?? 0;
      county++;
      lst[index].quantity = county;
    } else {
      lst.add(
        OrderModel(
          productId: orderDetails["productId"],
          name: orderDetails["name"],
          picture: orderDetails["picture"],
          quantity: counter + 1,
          price: orderDetails["price"],
          totalPrice: orderDetails["totalPrice"],
        ),
      );
    }
    notifyListeners();
  }

  // del(int index) {
  //   lst.removeAt(index);
  //   if (lst.isNotEmpty) {
  //     print('someFunction13');
  //   } else {
  //     print("Is Empty");
  //   }
  //   notifyListeners();
  // }
}
