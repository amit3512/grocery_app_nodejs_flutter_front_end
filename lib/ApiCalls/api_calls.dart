import 'dart:convert';

import '../models/productModel.dart';
import '../models/orderModel.dart';
import 'package:http/http.dart' as http;

class ApiCalls {
  Future<List<ProductModel>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:4000/api/category'));
    if (response.statusCode == 200) {
      // return parseProducts(response.body);
      final body = jsonDecode(response.body);
      List<ProductModel> products = body["data"]
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
      return products;
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  Future<List<OrderModel>> fetchOrder() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:4000/api/order'));
    if (response.statusCode == 200) {
      // return parseProducts(response.body);
      final body = jsonDecode(response.body);
      List<OrderModel> orders = body["data"]
          .map<OrderModel>((json) => OrderModel.fromJson(json))
          .toList();
      return orders;
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  // late Future<List<OrderModel>> hello = "hello" as Future<List<OrderModel>>;
  Future<List<OrderModel>> submitOrder(dataApi) async {
    print(dataApi);
    final response = await http.post(
        Uri.parse('http://10.0.2.2:4000/api/order'),
        body: dataApi,
        // headers: {'Content-type': 'application/json'}
    );
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      List<OrderModel> orders = body["data"]
          .map<OrderModel>((json) => OrderModel.fromJson(json))
          .toList();
      return orders;
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }
}
