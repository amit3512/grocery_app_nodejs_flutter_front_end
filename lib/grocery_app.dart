import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:grocery_app/ApiCalls/api_calls.dart';
//my own imports
// import 'package:grocery_app/components/horizontalListView.dart';
import 'package:grocery_app/components/products.dart';
import 'package:grocery_app/pages/cart.dart';

import 'package:grocery_app/provider/category_data_provider.dart';
import 'package:grocery_app/provider/order_data_provider.dart';
import 'package:provider/provider.dart';

import 'custom_widget/drawer_dash.dart';
// import 'package:grocery_app/custom_widget/drawer_dash.dart';

class GroceryApp extends StatefulWidget {
  const GroceryApp({Key? key}) : super(key: key);

  @override
  State<GroceryApp> createState() => _GroceryAppState();
}

class _GroceryAppState extends State<GroceryApp> {
  late final orderData;
  String _username = "";

  @override
  void initState() {
    super.initState();
    // ApiCalls().signIn();
    orderData =
        Provider.of<OrderDataProvider>(context, listen: false).badgeLength;
  }

  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: const [
          AssetImage("images/a.jpg"),
          AssetImage("images/b.jpg"),
          AssetImage("images/c.jpg"),
        ],
        autoplay: false,
        // animationCurve: Curves.fastOutSlowIn,
        // animationDuration: const Duration(milliseconds: 1000),
        dotSize: 4.0,
        // dotColor: Colors.red,
        indicatorBgPadding: 4.0,
      ),
    );
    return Consumer<CategoryDataProvider>(builder: (context, data, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text("Grocery App"),
          actions: [
            const IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: null,
            ),
            IconButton(
              icon: Badge(
                  badgeContent: Text(
                    orderData.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Icon(Icons.shopping_cart, color: Colors.white)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Cart()));
              },
            ),
          ],
        ),
        drawer: const DrawerDash(),
        body: data.loading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  imageCarousel,
                  // const Padding(
                  //   padding: EdgeInsets.all(8.0),
                  //   child: Text("Categories"),
                  // ),
                  // // Container(height: 200,width: 300,color: Colors.red,),
                  //  HorizontalListView(data),
                  const Padding(
                    padding:
                        EdgeInsets.only(left: 10.0, top: 20.0, bottom: 20.0),
                    child: Text("Recent Posts"),
                  ),
                  const SizedBox(
                    height: 320.0,
                    child: Products(),
                  )
                ],
              ),
      );
    });
  }
}
