import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _username = TextEditingController();
  var _password = TextEditingController();
  bool? checkclick = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 70, left: 10),
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 38,
                      color: Color.fromARGB(255, 15, 87, 146),
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  'Welcome to Login get amezing discounts and others only for you',
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(223, 95, 95, 95)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 10, top: 20),
                child: Text(
                  'User name',
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 95, 95, 95)),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: _username,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 10, top: 20),
                child: Text(
                  'Password',
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 95, 95, 95)),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: TextFormField(
                  controller: _password,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    Checkbox(
                      checkColor: Color.fromARGB(255, 248, 248, 248),
                      activeColor: Color(0xFF4cc4fe),
                      value: checkclick,
                      onChanged: (value) {
                        setState(() {
                          checkclick = value;
                        });
                      },
                    ),
                    const Text(
                      "Remember me",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 102, 102, 102)),
                    ),
                  ],
                ),
              ),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF4cc4fe),
                      minimumSize: Size(0, 60),
                    ),
                    onPressed: () {
                      print(
                          ">>Username${_username.text},\n Password is ${_password.text}<<");
                    },
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "New User?",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(228, 59, 59, 59)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Signup",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 16, 36, 104),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "Forget Your password",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                          color: Color.fromARGB(228, 59, 59, 59)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
