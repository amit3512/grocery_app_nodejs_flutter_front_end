import 'package:flutter/material.dart';
import 'package:grocery_app/components/cardProducts.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: const Text("Cart"),
        actions: const [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: null,
          ),

        ],
      ),
      body: const CartProducts(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: const [
            Expanded(child: ListTile(
              title: Text("Total"),
              subtitle: Text("\$400"),
            ))
          ],
        ),
      ),
    );
  }
}
