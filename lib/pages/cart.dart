import 'package:flutter/material.dart';
import 'package:grocery_app/components/cardProducts.dart';
import 'package:grocery_app/grocery_app.dart';
import 'package:grocery_app/pages/guestDetails.dart';
import 'package:grocery_app/provider/user_data_provider.dart';
import 'package:provider/provider.dart';

import '../components/guestDetailsForm.dart';
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
    return Consumer2<OrderDataProvider, UserDataProvider>(
        builder: (context, orderData, userData, child) {
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
                    if (userData.isAuthenticated == true) {
                      Map<String, dynamic> customerDetail = {
                        "user_id": userData.data!["result"]["user_id"],
                        "user_name": userData.data!["result"]["name"],
                        "user_email": userData.data!["result"]["email"],
                        "user_contact": userData.data!["result"]["contact"],
                      };
                      var dataOrder =
                          await orderData.submitOrder(customerDetail);
                      var snackBar = SnackBar(
                        content:
                            Text(dataOrder["message"] ?? orderData.message),
                        backgroundColor: (dataOrder["message"] != null
                            ? Colors.green
                            : Colors.pinkAccent[400]),
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
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Stack(
                                // overflow: Overflow.visible,
                                children: <Widget>[
                                  Positioned(
                                    right: 0.0,
                                    top: 0.0,
                                    child: InkResponse(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child:const CircleAvatar(
                                        child:  Icon(Icons.close),
                                        backgroundColor: Colors.red,
                                      ),
                                    ),
                                  ),
                                  const GuestDetailForm()
                                ],
                              ),
                            );
                          });
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
