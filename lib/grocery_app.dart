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
import 'package:provider/provider.dart';

class GroceryApp extends StatefulWidget {
  const GroceryApp({Key? key}) : super(key: key);

  @override
  State<GroceryApp> createState() => _GroceryAppState();
}

class _GroceryAppState extends State<GroceryApp> {
  @override
  void initState() {
    super.initState();
    var data = Provider.of<CategoryDataProvider>(context, listen: false);
    data.fetchData(true);
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
      // return Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Home'),
      //   ),
      //   body: data.loading
      //       ? const Center(child: CircularProgressIndicator())
      //       : Text(data.data![0].picture.toString(),style: TextStyle(color: Colors.red),),
      // );
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
                  badgeContent: const Text(
                    "0",
                    style: TextStyle(
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
        drawer: Drawer(
          child:
          ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: const Text("Amit Shrestha"),
                accountEmail: const Text("ambadcr7@gmail.com"),
                currentAccountPicture: GestureDetector(
                  child: const CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  title: Text("Homepage"),
                  leading: Icon(Icons.home, color: Colors.indigo),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  title: Text("My Account"),
                  leading: Icon(Icons.person),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  title: Text("My Orders"),
                  leading: Icon(Icons.shopping_basket, color: Colors.black),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Cart()));
                },
                child: const ListTile(
                  title: Text("Shopping Cart"),
                  leading: Icon(Icons.dashboard, color: Colors.red),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  title: Text("Favourites"),
                  leading: Icon(Icons.favorite, color: Colors.red),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  title: Text("Settings"),
                  leading: Icon(Icons.settings, color: Colors.blue),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  title: Text("About"),
                  leading: Icon(Icons.help, color: Colors.green),
                ),
              ),
            ],
          ),
        ),
        body: data.loading
              ? const Center(child: CircularProgressIndicator())
              : ListView(
          children: [
            imageCarousel,
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Categories"),
            ),
            // Container(height: 200,width: 300,color: Colors.red,),
             HorizontalListView(data),
            const Padding(
              padding: EdgeInsets.only(left: 10.0, top: 20.0, bottom: 20.0),
              child: Text("Recent Posts"),
            ),
            Container(
              height: 320.0,
              child: const Products(),
            )
          ],
        ),
      );
    });
  }
}
