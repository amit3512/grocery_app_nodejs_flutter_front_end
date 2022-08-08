import 'package:flutter/material.dart';
import 'package:grocery_app/components/cardProducts.dart';
import 'package:provider/provider.dart';

import '../provider/order_data_provider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderDataProvider>(builder: (context, orderData, child) {
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
            children: [
               Expanded(
                child: ListTile(
                  title: const Text("Total"),
                  // subtitle: Text("\$400"),
                  subtitle: Text(orderData.grandTotalPrice.toString()),

                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    orderData.submitOrder();
                  },
                  color: Colors.red,
                  child: const Text(
                    "Check Out",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });

  }
}
