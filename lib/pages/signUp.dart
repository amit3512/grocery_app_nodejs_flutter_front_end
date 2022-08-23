// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:grocery_app/ApiCalls/api_calls.dart';
import 'package:grocery_app/pages/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>(); //key for form
  bool _showEye = false;
  bool _cofirmshowEye = false;
  bool _passwordIsEncrypted = true;
  bool _confirmpasswordIsEncrypted = true;
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _contactTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmTextController = TextEditingController();
  String groupValue = "male";
  String gender = "male";
  String passCheck = "";

  onGenderChanged(e) {
    setState(() {
      if (e == "male") {
        groupValue = e;
        gender = e;
      } else if (e == "female") {
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
                    key: formKey, //key for form
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
                                  return (value != null)
                                      ? ''
                                      : "Please enter your name";
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
                              children: [
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
                                        onChanged: (e) => onGenderChanged(e)),
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
                                        onChanged: (e) => onGenderChanged(e)),
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
                                  return (value == null)
                                      ? "Please enter your e-mail"
                                      : "";
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
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white.withOpacity(0.5),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                controller: _passwordTextController,
                                decoration: InputDecoration(
                                    icon: const Icon(Icons.lock_outlined),
                                    hintText: 'Password',
                                    suffixIcon: _showEye
                                        ? GestureDetector(
                                            child: _passwordIsEncrypted
                                                ? Container(
                                                    width: 15,
                                                    height: 15,
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10.0),
                                                    child: Image.asset(
                                                        "images/view.png",
                                                        height: 10.0,
                                                        width: 15.0),
                                                  )
                                                : Container(
                                                    width: 15,
                                                    height: 15,
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10.0),
                                                    child: Image.asset(
                                                        "images/hide.png",
                                                        height: 10.0,
                                                        width: 15.0),
                                                  ),
                                            onTap: () {
                                              setState(() {
                                                _passwordIsEncrypted =
                                                    !_passwordIsEncrypted;
                                              });
                                            },
                                          )
                                        : null
                                    // labelText: 'Password',
                                    ),
                                obscureText:
                                    _showEye ? _passwordIsEncrypted : true,
                                onChanged: (enteredPassword) {
                                  if (enteredPassword.isEmpty) {
                                    setState(() {
                                      _showEye = false;
                                    });
                                  } else if (!_showEye) {
                                    setState(() {
                                      _showEye = !_showEye;
                                    });
                                  } else {
                                    passCheck = enteredPassword;
                                    print(passCheck);
                                  }
                                },
                                onSaved: (String? value) {
                                  // This optional block of code can be used to run
                                  // code when the user saves the form.
                                },
                                validator: (String? value) {
                                  return (value != null && value.length < 6)
                                      ? "The password has to be at least 6 characters long"
                                      : value == null
                                          ? "The password field cannot be empty"
                                          : "";
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

                                decoration: InputDecoration(
                                    icon: const Icon(Icons.lock_clock_outlined),
                                    hintText: 'Confirm Password',
                                    suffixIcon: _cofirmshowEye
                                        ? GestureDetector(
                                            child: _confirmpasswordIsEncrypted
                                                ? Container(
                                                    width: 15,
                                                    height: 15,
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10.0),
                                                    child: Image.asset(
                                                        "images/view.png",
                                                        height: 10.0,
                                                        width: 15.0),
                                                  )
                                                : Container(
                                                    width: 15,
                                                    height: 15,
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10.0),
                                                    child: Image.asset(
                                                        "images/hide.png",
                                                        height: 10.0,
                                                        width: 15.0),
                                                  ),
                                            onTap: () {
                                              setState(() {
                                                _confirmpasswordIsEncrypted =
                                                    !_confirmpasswordIsEncrypted;
                                              });
                                            },
                                          )
                                        : null
                                    // labelText: 'Email',

                                    ),
                                // keyboardType: TextInputType.emailAddress,
                                obscureText: _cofirmshowEye
                                    ? _confirmpasswordIsEncrypted
                                    : true,
                                onChanged: (enteredPassword) {
                                  if (enteredPassword.isEmpty) {
                                    setState(() {
                                      _cofirmshowEye = false;
                                    });
                                  } else if (!_cofirmshowEye) {
                                    setState(() {
                                      _cofirmshowEye = !_cofirmshowEye;
                                    });
                                  }
                                },
                                onSaved: (String? value) {
                                  // This optional block of code can be used to run
                                  // code when the user saves the form.
                                },
                                validator: (String? value) {
                                  return (value != null &&
                                          !value.contains(passCheck))
                                      ? 'Password mismatched'
                                      : (value != null && value.length < 6)
                                          ? "The confirm password has to be at least 6 characters long"
                                          : value == null
                                              ? "The confirm password field cannot be empty"
                                              : "";
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
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  const snackBar = SnackBar(
                                      content: Text("Submitting Form"));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else {
                                  signUp(
                                      _nameTextController.text,
                                      gender,
                                      _emailTextController.text,
                                      _contactTextController.text,
                                      _passwordTextController.text,
                                      _confirmTextController.text);
                                }
                              },
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

signUp(name, gender, email, contact, password, confirmPassword) async {
  print(password);
  print(confirmPassword);
  String pattern =
      // r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
      r"^[a-z0-9.a-z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-z]+\.[a-z]+";
  // r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@gmail+\.[a-z]+";
  bool isValid = RegExp(pattern).hasMatch(email);
  if (isValid) {
    if (password == confirmPassword) {
      var dataApi = {
        "username": name,
        "gender": gender,
        "email": email,
        "contact": contact,
        "password": password
      };
      await ApiCalls().signUp(dataApi);
    }
  }
}
