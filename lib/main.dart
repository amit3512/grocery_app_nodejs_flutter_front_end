import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_pro/carousel_pro.dart';
//my own imports
import 'package:grocery_app/components/horizontalListView.dart';
import 'package:grocery_app/components/products.dart';
import 'package:grocery_app/pages/cart.dart';
import 'package:grocery_app/pages/login.dart';
import 'package:grocery_app/controllers/cartController.dart';
import 'package:grocery_app/provider/category_data_provider.dart';
import 'package:grocery_app/provider/order_data_provider.dart';
import 'package:grocery_app/provider/user_data_provider.dart';
import 'package:provider/provider.dart';

import 'grocery_app.dart';

// void main() {
//   runApp(const MaterialApp(
//     home: GroceryApp(),
//     // home: Login(),
//   ));
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initialization.then((value){
  // Get.put(AppController());
  // Get.put(UserController());
  // Get.put(ProducsController());
  // Get.put(CartController());
  // Get.put(PaymentsController());
  // });
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryDataProvider()),
        ChangeNotifierProvider(create: (_) => OrderDataProvider()),
        ChangeNotifierProvider(create: (_) => UserDataProvider())
      ],
      // const GetMaterialApp(
      child: const MaterialApp(
        // home: GroceryApp(),
        home: Login(),
        // title: 'Login Demo',
        // routes: {
        //   '/': (context) => const Login(),
        //   // '/': (context) => const GroceryApp(),
        // },
        // theme: ThemeData(
        //   primarySwatch: Colors.green,
        // ),
      ),
    ),
  );
}
