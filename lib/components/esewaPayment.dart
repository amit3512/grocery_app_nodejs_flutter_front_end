import 'package:esewa_pnp/esewa.dart';
import 'package:esewa_pnp/esewa_pnp.dart';
import 'package:flutter/material.dart';

class EsewaPayment extends StatefulWidget {
  const EsewaPayment({Key? key}) : super(key: key);

  @override
  State<EsewaPayment> createState() => _EsewaPaymentState();
}

class _EsewaPaymentState extends State<EsewaPayment> {
  late ESewaPnp _esewaPnp;
  late ESewaConfiguration _configuration;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    _configuration = ESewaConfiguration(
      clientID: "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R",
      secretKey: "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==",
      environment: ESewaConfiguration.ENVIRONMENT_TEST,
    );
    _esewaPnp = ESewaPnp(configuration: _configuration);
  }

  double _amount = 0;
  @override
  Widget build(BuildContext context) {
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
              _esewaPnp,
              amount: _amount,
              callBackURL: "https://example.com",
              productId: "abc123",
              productName: "Flutter SDK Example",
              onSuccess: (result) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: const Color.fromRGBO(65, 161, 36, 1),
                  content: Text(result.message.toString()),
                ));
              },
              onFailure: (e) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: const Color.fromRGBO(65, 161, 36, 1),
                  content: Text(e.message.toString()),
                ));
              },
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
  }
}
