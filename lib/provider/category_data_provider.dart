import 'package:flutter/material.dart';
import 'package:grocery_app/ApiCalls/api_calls.dart';
import '../models/productModel.dart';
import 'package:grocery_app/models/productModel.dart';

class CategoryDataProvider extends ChangeNotifier {
  bool loading = false;
  bool? refresh;
  int count = 0;

  List<ProductModel>? data;
  fetchData([refresh = false]) async {
    if (data == null || refresh == true) {
      loading = true;
      data = await ApiCalls().fetchProducts();
      print(data![0].name);
      loading = false;
      notifyListeners();
    }
  }

  List<ProductModel> lst = <ProductModel>[];

  add(String sId, String name, String picture, int prodOldPrice,
      int prodPrice) {
    if (lst.isNotEmpty) {
       lst.map((e) => {
            if (sId == e.sId)
              {debugPrint("matched")}
            else
              // {debugPrint("mismathched")}
              {
                lst.add(ProductModel(
                    sId: sId,
                    name: name,
                    picture: picture,
                    oldPrice: prodOldPrice,
                    price: prodPrice))
              }
          });
    } else {
      print("Is Empty");
      lst.add(ProductModel(
          sId: sId,
          name: name,
          picture: picture,
          oldPrice: prodOldPrice,
          price: prodPrice));
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


