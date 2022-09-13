// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:grocery_app/ApiCalls/api_calls.dart';
import 'package:grocery_app/pages/login.dart';
import 'package:provider/provider.dart';

import '../grocery_app.dart';
import '../provider/order_data_provider.dart';

class GuestDetailForm extends StatefulWidget {
  const GuestDetailForm({Key? key}) : super(key: key);

  @override
  State<GuestDetailForm> createState() => _GuestDetailFormState();
}

class _GuestDetailFormState extends State<GuestDetailForm> {
  final formKey = GlobalKey<FormState>(); //key for form

  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _contactTextController = TextEditingController();
  // String groupValue = "male";
  // String gender = "male";
  // String passCheck = "";

  // onGenderChanged(e) {
  //   setState(() {
  //     if (e == "male") {
  //       groupValue = e;
  //       gender = e;
  //     } else if (e == "female") {
  //       groupValue = e;
  //       gender = e;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderDataProvider>(builder: (context, orderData, child) {
      return Scaffold(
        body: Stack(
          children: [
            // Image.asset(
            //   "images/products/grocery_login.jpg",
            //   fit: BoxFit.cover,
            //   // width: double.infinity,
            //   height: double.infinity,
            // ),
            // Container(
            //   color: Colors.black.withOpacity(0.3),
            //   width: double.infinity,
            //   height: double.infinity,
            // ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                child: Form(
                  key: formKey, //key for form
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(0.0),
                          color: Colors.white.withOpacity(0.7),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: TextFormField(
                              controller: _nameTextController,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.person),
                                hintText: 'Full Name',
                                // labelText: 'Email',
                              ),
                              // keyboardType: TextInputType.emailAddress,
                              onSaved: (String? value) {
                                // This optional block of code can be used to run
                                // code when the user saves the form.
                              },
                              validator: (String? value) {
                                return (value != null)
                                    ? ''
                                    : "Please enter your name";
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.5),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: TextFormField(
                              controller: _emailTextController,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.email),
                                hintText: 'Email',
                                // labelText: 'Email',
                              ),
                              // keyboardType: TextInputType.emailAddress,
                              onSaved: (String? value) {
                                // This optional block of code can be used to run
                                // code when the user saves the form.
                              },
                              validator: (String? value) {
                                return (value == null)
                                    ? "Please enter your e-mail"
                                    : "";
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.5),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: TextFormField(
                              controller: _contactTextController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.perm_contact_calendar),
                                hintText: 'Contact No.',
                                // labelText: 'Email',
                              ),
                              // keyboardType: TextInputType.emailAddress,
                              onSaved: (String? value) {
                                // This optional block of code can be used to run
                                // code when the user saves the form.
                              },
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter your contact no.';
                                } else if (value.length < 10) {
                                  return "The contact no has to be at least 10 characters long";
                                }
                                // Check if the entered email has the right format
                                // if (!RegExp(r'\S+@\S+\.\S+')
                                //     .hasMatch(value)) {
                                //   return 'Please enter a valid email address';
                                // }
                                // Return null if the entered email is valid
                                return null;
                              },
                              // onChanged: (value) => _emailTextController =
                              //     value as TextEditingController,
                              // validator: (String? value) {
                              //   return (value != null && value.contains('@'))
                              //       ? 'Do not use the @ char.'
                              //       : null;
                              // },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              const snackBar =
                                  SnackBar(content: Text("Submitting Form"));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              Map<String, dynamic> customerDetail = {
                                "user_name": _nameTextController.text,
                                "user_email": _emailTextController.text,
                                "user_contact": _contactTextController.text,
                              };
                              var dataOrder =
                                  await orderData.submitOrder(customerDetail);
                              var snackBar = SnackBar(
                                content: Text(
                                    dataOrder["message"] ?? orderData.message),
                                backgroundColor: (dataOrder["message"] != null
                                    ? Colors.green
                                    : Colors.pinkAccent[400]),
                                // action: SnackBarAction(
                                //   label: 'Dismiss',
                                //   onPressed: () {
                                //   },
                                // ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const GroceryApp()),
                              );
                            }
                          },
                          child: const Text(
                            "Order!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
