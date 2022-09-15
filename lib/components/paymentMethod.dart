// import 'package:esewa_pnp/esewaPayment.dart';
// import 'package:esewa_pnp/esewa_pnp.dart';
import 'package:esewa_pnp/esewa.dart';
import 'package:esewa_pnp/esewa_pnp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/order_data_provider.dart';
import 'esewaPayment.dart';

class PaymentMethodForm extends StatefulWidget {
  const PaymentMethodForm({Key? key}) : super(key: key);

  @override
  State<PaymentMethodForm> createState() => _PaymentMethodForm();
}

class _PaymentMethodForm extends State<PaymentMethodForm> {
  final formKey = GlobalKey<FormState>(); //key for form

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderDataProvider>(builder: (context, orderData, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MaterialButton(
            color: Colors.green,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EsewaPayment()));
            },
            child: const SizedBox(
              width: 300,
              height: 45,
              child: Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text('E-sewa',
                      style: TextStyle(fontSize: 20.0, color: Colors.white))),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          MaterialButton(
              color: Colors.purple,
              onPressed: () {},
              child: const SizedBox(
                width: 300,
                height: 45,
                child: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text('Khalti',
                        style: TextStyle(fontSize: 20.0, color: Colors.white))),
              )),
        ],
      );
    });
  }
}
