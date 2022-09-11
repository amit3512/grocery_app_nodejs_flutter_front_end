import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grocery_app/pages/cart.dart';

import '../pages/login.dart';

class DrawerDash extends StatelessWidget {
  final userName;
  final userEmail;
  final userStatus;
  final userFunction;
  const DrawerDash(
      {Key? key,
      required this.userName,
      required this.userEmail,
      required this.userStatus,
      required this.userFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(userName),
            accountEmail: Text(userEmail),
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
              // if () {
              //   Navigator.of(context).push(
              //     MaterialPageRoute(
              //       builder: (context) => const Login(),
              //     ),
              //   );
              // }

            },
            child: ListTile(
              title: Text(userStatus),
              leading: const Icon(Icons.help, color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}
