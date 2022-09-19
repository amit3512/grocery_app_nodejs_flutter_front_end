import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/order_data_provider.dart';
import '../provider/user_data_provider.dart';

class PurchasedProductDetails extends StatefulWidget {
  const PurchasedProductDetails({Key? key}) : super(key: key);

  @override
  State<PurchasedProductDetails> createState() =>
      _PurchasedProductDetailsState();
}

class _PurchasedProductDetailsState extends State<PurchasedProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<UserDataProvider, OrderDataProvider>(
        builder: (context, userData, orderData, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 250,
            height: 50,
            child: const Center(
                child: Text(
              "Purchased Product Details",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 5, color: Colors.white)),
          ),
          Container(
            alignment: Alignment.center,
            child: Card(
              child: SizedBox(
                height: 300,
                width: 300,
                child: ListView(
                    children: orderData.lst
                        .map(
                          (e) => Card(
                            child: ListTile(
                              leading: Text(e.name.toString()),
                              // subtitle: Text(e.quantity.toString()),
                              trailing: Text("Rs." +
                                  e.price.toString() +
                                  " " +
                                  "(" +
                                  e.quantity.toString() +
                                  ')'),
                            ),
                          ),
                        )
                        .toList()),
              ),
            ),
          ),
          FractionalTranslation(
            translation: const Offset(0, -0.5),
            child: Container(
              width: 170,
              height: 50,
              child: Center(
                  child: Text(
                "Total : Rs." + orderData.grandTotalPrice.toString(),
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 5, color: Colors.white)),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      );
    });
  }
}
