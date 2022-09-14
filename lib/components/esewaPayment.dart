import 'package:esewa_pnp/esewa.dart';
import 'package:esewa_pnp/esewa_pnp.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/grocery_app.dart';
import 'package:provider/provider.dart';

import '../provider/order_data_provider.dart';
import '../provider/user_data_provider.dart';

class EsewaPayment extends StatefulWidget {
  const EsewaPayment({Key? key}) : super(key: key);

  @override
  State<EsewaPayment> createState() => _EsewaPaymentState();
}

class _EsewaPaymentState extends State<EsewaPayment> {
  ESewaPnp? _esewaPnp;
  // late ESewaConfiguration _configuration;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _configuration = ESewaConfiguration(
    clientID: "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R",
    secretKey: "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==",
    environment: ESewaConfiguration.ENVIRONMENT_TEST,
  );

  @override
  void initState() {
    super.initState();
    _esewaPnp = ESewaPnp(configuration: _configuration);
  }

  double _amount = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserDataProvider, OrderDataProvider>(
        builder: (context, userData, orderData, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Online Payment"),
          backgroundColor: Colors.red,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _amount = double.parse(value);
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Enter amount",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ESewaPaymentButton(
                _esewaPnp!,
                amount: _amount,
                callBackURL: "https://example.com",
                productId: "abc123",
                productName: "Flutter SDK Example",
                onSuccess: (result) {
                  Map<String, dynamic> customerDetail = {
                    "user_id": userData.data!["result"]["user_id"],
                    "user_name": userData.data!["result"]["name"],
                    "user_email": userData.data!["result"]["email"],
                    "user_contact": userData.data!["result"]["contact"],
                  };
                  orderData.submitOrder(customerDetail);
                  Future.delayed(const Duration(seconds: 2), () {
                    if (orderData.paymenStatus == true) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GroceryApp()));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: const Color.fromRGBO(65, 161, 36, 1),
                        content: Text(result.message.toString()),
                      ));
                    }
                  });
                },

                onFailure: (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: const Color.fromRGBO(65, 161, 36, 1),
                    content: Text(e.message.toString()),
                  ));
                },

                color: Colors.red,
                // labelBuilder: (double? amount, Widget? esewaLogo) {
                //   return Text("Pay Rs. $amount");
                // },
              ),
              const SizedBox(
                height: 84,
              ),
              const Text(
                "Plugin developed by Ashim Upadhaya.",
                style: TextStyle(color: Colors.black45),
              )
            ],
          ),
        ),
      );
    });
  }
}
