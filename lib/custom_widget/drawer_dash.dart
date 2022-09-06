import 'package:flutter/material.dart';
import 'package:grocery_app/pages/cart.dart';

class DrawerDash extends StatelessWidget {
  // final nameUser;
  // final emailUser;
  const DrawerDash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("nameUser"),
            accountEmail: Text("emailUser"),
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
    );
  }
}
