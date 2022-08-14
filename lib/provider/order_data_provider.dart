import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:grocery_app/ApiCalls/api_calls.dart';
import '../models/orderModel.dart';

class OrderDataProvider extends ChangeNotifier {
  // final int _counter = 0;
  // int get counter => _counter;
  // final double _grandTotalPrice = 0.0;
  // double get grandTotalPrice => _grandTotalPrice;
  bool loading = false;
  bool? refresh;
  bool? added;
  int? badgeLength = 0;
  double grandTotalPrice = 0.0;
  int counter = 0;
  String? message;
  dynamic dataResponse;

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
    grandTotalPrice = orderDetails["totalPrice"];
    // print(grandTotalPrice);
    var index = lst.indexWhere(
        (element) => element.productId == orderDetails["productId"]);
    if (index != -1) {
      int? county = lst[index].quantity ?? 0;
      county++;
      lst[index].quantity = county;
      lst[index].price = orderDetails["prodPrice"] * county;
      added = true;
    } else {
      lst.add(
        OrderModel(
          productId: orderDetails["productId"],
          name: orderDetails["name"],
          picture: orderDetails["picture"],
          quantity: counter + 1,
          price: orderDetails["prodPrice"],
          totalPrice: orderDetails["totalPrice"],
        ),
      );
      added = true;
    }
    // badgeLength = lst.length;
    // print(badgeLength);
    notifyListeners();
  }

  remove(Map<String, dynamic> orderDetails) {
    grandTotalPrice = orderDetails["totalPrice"];
    var index = lst.indexWhere(
        (element) => element.productId == orderDetails["productId"]);
    if (index != -1) {
      int? county = lst[index].quantity ?? 0;
      print(county);
      county--;
      if (county == 0) {
        lst.removeWhere(
            (element) => element.productId == orderDetails["productId"]);
      } else {
        lst[index].quantity = county;
        lst[index].price = orderDetails["prodPrice"] * county;
      }
    } else {
      lst.removeAt(index = -1);
    }
    // badgeLength = lst.length;
    // print(badgeLength);
    notifyListeners();
  }

  del(int index, double grandTotal) {
    grandTotalPrice = grandTotal;
    lst.removeAt(index);
    if (lst.isNotEmpty) {
      // print('someFunction13');
    } else {
      // print("Is Empty");
    }
    notifyListeners();
  }

  submitOrder() async {
    if (lst.isNotEmpty) {
      try {
        var dataApi = {
          "orderData": lst
              .map((e) => {
                    "productId": e.productId,
                    "name": e.name,
                    "picture": e.picture,
                    "quantity": e.quantity,
                    "price": e.price,
                    "totalPrice": grandTotalPrice,
                  })
              .toList()
        };
        final response = await http.post(
            Uri.parse('http://10.0.2.2:4000/api/order'),
            body: jsonEncode(dataApi),
            headers: {'Content-type': 'application/json'});
        if (response.statusCode == 200) {
          return jsonDecode(response.body);
        } else {
          throw Exception('Unable to fetch products from the REST API');
        }
      } catch (err) {
        rethrow;
      }
    } else {
      message = "Cart is Empty";
    }

    notifyListeners();
  }
}
