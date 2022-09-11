import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:grocery_app/ApiCalls/api_calls.dart';
//my own imports
// import 'package:grocery_app/components/horizontalListView.dart';
import 'package:grocery_app/components/products.dart';
import 'package:grocery_app/pages/cart.dart';
import 'package:grocery_app/pages/login.dart';

import 'package:grocery_app/provider/category_data_provider.dart';
import 'package:grocery_app/provider/order_data_provider.dart';
import 'package:grocery_app/provider/user_data_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'custom_widget/drawer_dash.dart';
// import 'package:grocery_app/custom_widget/drawer_dash.dart';

class GroceryApp extends StatefulWidget {
  const GroceryApp({Key? key}) : super(key: key);

  @override
  State<GroceryApp> createState() => _GroceryAppState();
}

class _GroceryAppState extends State<GroceryApp> {
  late final orderData;
  late final userAuth;
  late final asd;
  String? token;
  String _username = "";

  @override
  void initState() {
    super.initState();
    // checkLogin();
    print("token");
    print(token);
    orderData =
        Provider.of<OrderDataProvider>(context, listen: false).badgeLength;
    // userAuth = Provider.of<UserDataProvider>(context, listen: false).data!["result"];
  }

  // void checkLogin() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String? val = pref.getString("login");
  //   if (val != null) {
  //     setState(() {
  //       token = val;
  //     });
  //   }
  // }

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
    return Consumer3<CategoryDataProvider, UserDataProvider, OrderDataProvider>(
        builder: (context, data, userData, orderD, child) {
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
                    orderD.badgeLength.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Icon(Icons.shopping_cart, color: Colors.white)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Cart()));
              },
            ),
          ],
        ),
        drawer:
            // DrawerDash(
            //     userName: userData.isAuthenticated
            //         ? userData.data!["result"]["name"]
            //         : "Guest",
            //     userEmail: userData.isAuthenticated
            //         ? userData.data!["result"]["email"]
            //         : "Guest",
            //     userStatus: userData.isAuthenticated ? "Log Out" : "Log In",
            //     userFunction: userData.signOut()),
            Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: userData.token != null
                    ? Text(userData.data!["result"]["name"].toString())
                    : const Text("Guest"),
                accountEmail: userData.token != null
                    ? Text(userData.data!["result"]["email"].toString())
                    : const Text("Guest"),
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
              InkWell(
                onTap: () {
                  userData.signOut();
                  print(userData.token);
                  Future.delayed(
                      const Duration(milliseconds: 3000),
                      () => {
                            if (userData.token == null)
                              {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const Login(),
                                  ),
                                )
                              }
                            else
                              {const CircularProgressIndicator()}
                          });
                },
                child: ListTile(
                  title: userData.token != null
                      ? const Text("Log Out")
                      : const Text("Log In"),
                  leading: const Icon(Icons.logout, color: Colors.red),
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
