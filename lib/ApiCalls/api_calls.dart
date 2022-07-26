import 'dart:convert';

import '../models/productModel.dart';
import 'package:http/http.dart' as http;

class ApiCalls{
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
}