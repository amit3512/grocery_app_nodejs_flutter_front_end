import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grocery_app/ApiCalls/all_apis.dart';
import 'package:http/http.dart' as http;
import 'package:grocery_app/ApiCalls/api_calls.dart';
import '../models/orderModel.dart';

class OrderDataProvider extends ChangeNotifier {
  // final int _counter = 0;
  // int get counter => _counter;
  // final double _grandTotalPrice = 0.0;
  // double get grandTotalPrice => _grandTotalPrice;
  bool loading = false;
  bool paymenStatus = false;
  bool? refresh;
  bool? added;
  int badgeLength = 0;
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
    var index = lst.indexWhere(
        (element) => element.productId == orderDetails["productId"]);
    if (index != -1) {
      int? county = lst[index].quantity ?? 0;
      county++;
      lst[index].quantity = county;
      lst[index].price = orderDetails["prodPrice"] * county;
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
      badgeLength = badgeLength + 1;
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
      county--;
      if (county == 0) {
        badgeLength = badgeLength - 1;

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
      badgeLength = badgeLength - 1;
    } else {
      badgeLength = 0;
    }

    notifyListeners();
  }

  submitOrder(Map<String, dynamic> customerDetail) async {
    if (lst.isNotEmpty) {
      try {
        var dataApi = {
          "user_id": customerDetail["user_id"],
          "user_name": customerDetail["user_name"],
          "user_email": customerDetail["user_email"],
          "user_contact": customerDetail["user_contact"],
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
        print("OrderData");
        print(dataApi);
        final response = await http.post(
            Uri.parse(AllApis.apiRouteForFetchOrder),
            body: jsonEncode(dataApi),
            headers: {'Content-type': 'application/json'});
        if (response.statusCode == 200) {
          lst = [];
          badgeLength = 0;
          grandTotalPrice = 0.0;
          paymenStatus = true;
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

  paymentSuccess() {
    lst = [];
    grandTotalPrice = 0.0;
    badgeLength = 0;
    notifyListeners();
  }
}
