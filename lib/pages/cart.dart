import 'package:flutter/material.dart';
import 'package:grocery_app/components/cardProducts.dart';
import 'package:grocery_app/grocery_app.dart';
import 'package:provider/provider.dart';

import '../provider/order_data_provider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  get messages => null;

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
                  subtitle: Text(orderData.grandTotalPrice.toString()),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () async {
                    var dataOrder = await orderData.submitOrder();
                    if (dataOrder != null && orderData.lst.isNotEmpty) {
                      var snackBar = SnackBar(
                        content: Text(dataOrder["message"]),
                        backgroundColor: (Colors.green),
                        // action: SnackBarAction(
                        //   label: 'Dismiss',
                        //   onPressed: () {
                        //   },
                        // ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GroceryApp()),
                      );
                    } else {
                      final snackBar = SnackBar(
                        content: const Text("Your order can't be placed."),
                        backgroundColor: (Colors.red),
                        action: SnackBarAction(
                          label: 'Dismiss',
                          onPressed: () {},
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
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
