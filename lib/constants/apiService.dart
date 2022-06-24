import 'package:flutter/material.dart';
import 'package:grocery_app/pages/productDetails.dart';
import 'package:grocery_app/models/productModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  fetchCategoryData() {
    List<ProductModel> parseProducts(String responseBody) {
      final parsed = json.decode(responseBody).cast<String, dynamic>();
      return parsed["data"]
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
    }

    Future<List<ProductModel>> fetchProducts() async {
      final response =
          await http.get(Uri.parse('http://10.0.2.2:4000/api/category'));
      if (response.statusCode == 200) {
        return parseProducts(response.body);
      } else {
        throw Exception('Unable to fetch products from the REST API');
      }
    }

    return fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
