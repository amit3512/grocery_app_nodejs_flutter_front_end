import 'package:flutter/material.dart';
import 'package:grocery_app/ApiCalls/api_calls.dart';
import 'package:grocery_app/provider/category_data_provider.dart';
import 'package:provider/provider.dart';
import '../models/orderModel.dart';

class OrderDataProvider extends ChangeNotifier {
  bool loading = false;
  bool? refresh;
  // final int _counter = 0;
  // int get counter => _counter;
  // final double _grandTotalPrice = 0.0;
  // double get grandTotalPrice => _grandTotalPrice;
  double grandTotalPrice = 0.0;
  int counter = 0;

  // super.initState();
  // var data = Provider.of<CategoryDataProvider>(context, listen: false);
  // data.fetchProductData(true);

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
    print(grandTotalPrice);
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
          price: orderDetails["price"],
          totalPrice: orderDetails["prodPrice"],
        ),
      );
    }
    notifyListeners();
  }

  del(int index) {
    lst.removeAt(index);
    if (lst.isNotEmpty) {
      print('someFunction13');
    } else {
      print("Is Empty");
    }
    notifyListeners();
  }
}
