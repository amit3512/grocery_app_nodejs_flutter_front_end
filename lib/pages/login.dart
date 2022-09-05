import 'package:flutter/material.dart';
import 'package:grocery_app/ApiCalls/api_calls.dart';
import 'package:grocery_app/grocery_app.dart';
import 'package:grocery_app/pages/signUp.dart';
import 'package:grocery_app/provider/user_data_provider.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserDataProvider>(
      builder: (context, user, child) => Scaffold(
        body: SafeArea(
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
                  padding: const EdgeInsets.only(top: 200.0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Center(
                      child: Form(
                        key: _formKey,
                        child: ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white.withOpacity(0.5),
                                elevation: 0.0,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 12.0),
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
                                      return (value != null &&
                                              value.contains('@'))
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
                                      return (value != null &&
                                              value.contains('@'))
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
                                color: Colors.blue.withOpacity(0.5),
                                elevation: 0.0,
                                child: MaterialButton(
                                  onPressed: () {
                                    var dataApi = {
                                      "email":_emailTextController.text,
                                      "password":_passwordTextController.text
                                    };
                                    user.fetchUserData(dataApi);
                                    if(user.isAuthenticated == true){
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => const GroceryApp(),
                                        ),
                                      );
                                    }
                                    // signIn(_emailTextController.text,
                                    //     _passwordTextController.text);
                                  },
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20.0),
                                  ),
                                  minWidth: MediaQuery.of(context).size.width,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Forgot Password",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUp()));
                                },
                                child: const Text(
                                  "Sign Up !",
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
        ),
      ),
    );
  }
}

signIn(email, password) async {
  print(email);
  print(password);
  String pattern =
      // r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
      r"^[a-z0-9.a-z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-z]+\.[a-z]+";
  // r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@gmail+\.[a-z]+";
  bool isValid = RegExp(pattern).hasMatch(email);
  if (isValid) {
    var dataApi = {"email": email, "password": password};
    await ApiCalls().signIn(dataApi);
  }
}
