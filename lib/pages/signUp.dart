import 'dart:math';

import 'package:flutter/material.dart';
import 'package:grocery_app/pages/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmTextController = TextEditingController();
  String groupValue = "male";
  String gender = "male";


  onGenderChanged(e){
    setState(() {
      if(e=="male"){
        groupValue = e;
        gender = e;
      }else if (e=="female"){
        groupValue = e;
        gender = e;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              "images/products/grocery_login.jpg",
              fit: BoxFit.cover,
              // width: double.infinity,
              height: double.infinity,
            ),
            Container(
              color: Colors.black.withOpacity(0.3),
              width: double.infinity,
              height: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Container(
                alignment: Alignment.center,
                child: Center(
                  child: Form(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white.withOpacity(0.5),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
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
                                  return (value != null && value.contains('@'))
                                      ? 'Do not use the @ char.'
                                      : null;
                                },
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.white.withOpacity(0.3),
                            child: Row(
                              children:  [
                                Expanded(
                                  child: ListTile(
                                    title: const Text(
                                      "Male",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    leading: Radio(
                                        value: "male",
                                        groupValue: groupValue,
                                        onChanged:(e)=> onGenderChanged(e)),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: const Text(
                                      "Female",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    leading: Radio(
                                        value: "female",
                                        groupValue: groupValue,
                                        onChanged:(e)=> onGenderChanged(e)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white.withOpacity(0.5),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
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
                                  return (value != null && value.contains('@'))
                                      ? 'Do not use the @ char.'
                                      : null;
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white.withOpacity(0.5),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                controller: _passwordTextController,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.lock_outlined),
                                  hintText: 'Password',
                                  // labelText: 'Password',
                                ),
                                // keyboardType: TextInputType.emailAddress,
                                onSaved: (String? value) {
                                  // This optional block of code can be used to run
                                  // code when the user saves the form.
                                },
                                validator: (String? value) {
                                  return (value != null && value.contains('@'))
                                      ? 'Do not use the @ char.'
                                      : value != null && value.length > 6
                                          ? "The password has to be at least 6 characters long"
                                          : "The password field cannot be empty";
                                },
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white.withOpacity(0.5),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                controller: _confirmTextController,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.lock_clock_outlined),
                                  hintText: 'Confirm Password',
                                  // labelText: 'Email',
                                ),
                                // keyboardType: TextInputType.emailAddress,
                                onSaved: (String? value) {
                                  // This optional block of code can be used to run
                                  // code when the user saves the form.
                                },
                                validator: (String? value) {
                                  return (value != null)
                                      ? 'Do not use the @ char.'
                                      : value == null
                                          ? "Confirm Password cant be empty!"
                                          : '';
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.blue.withOpacity(0.5),
                            elevation: 0.0,
                            child: MaterialButton(
                              onPressed: () {},
                              child: const Text(
                                "Register ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20.0),
                              ),
                              minWidth: MediaQuery.of(context).size.width,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Login()));
                            },
                            child: const Text(
                              "Log In !",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                        // Expanded(child: Container()),
                        // const Divider(
                        //   color: Colors.white,
                        // ),
                        // const Text(
                        //   "Other Login Options",
                        //   style: TextStyle(fontSize: 20.0, color: Colors.white),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Material(
                        //       borderRadius: BorderRadius.circular(20.0),
                        //       color: Colors.red.withOpacity(0.5),
                        //       elevation: 0.0,
                        //       child: MaterialButton(
                        //         onPressed: () {},
                        //         child: const Text(
                        //           "Google",
                        //           style: TextStyle(
                        //               fontWeight: FontWeight.bold,
                        //               color: Colors.white,
                        //               fontSize: 20.0),
                        //         ),
                        //         minWidth: MediaQuery.of(context).size.width,
                        //       )),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        // bottomNavigationBar: Container(
        //   child: FlatButton(
        //     onPressed: () {},
        //     color: Colors.red.shade900,
        //     child: const Text(
        //       "SignUp/Login",
        //       style: TextStyle(
        //         fontSize: 20.0,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}


