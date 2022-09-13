import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/productModel.dart';
import '../models/orderModel.dart';
import 'package:http/http.dart' as http;
import "./all_apis.dart";

class ApiCalls {
  Future<List<ProductModel>> fetchProducts() async {
    final response =
        // await http.get(Uri.parse('http://10.0.2.2:4000/api/category'));
    await http.get(Uri.parse(AllApis.apiRouteForGetCategory));

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
        await http.get(Uri.parse(AllApis.apiRouteForFetchOrder));
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

  submitOrder(dataApi) async {
    final response = await http.post(
        Uri.parse(AllApis.apiRouteForFetchOrder),
        body: jsonEncode(dataApi),
        headers: {'Content-type': 'application/json'});
    // print(response.statusCode);
    if (response.statusCode == 200) {
      // print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  signUp(dataApi) async {
    print(dataApi);
    final response = await http.post(
        Uri.parse(AllApis.apiRouteForSignUp),
        body: jsonEncode(dataApi),
        headers: {'Content-type': 'application/json'});
    print(response.statusCode);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Unable to fetch users from the REST API');
      }
    }

  signIn(dataApi) async {
    print(dataApi);
    final response = await http.post(
        Uri.parse(AllApis.apiRouteForLogin),
        body: jsonEncode(dataApi),
        headers: {'Content-type': 'application/json'});
    print(response.statusCode);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Unable to fetch users from the REST API');
    }
  }
  }

