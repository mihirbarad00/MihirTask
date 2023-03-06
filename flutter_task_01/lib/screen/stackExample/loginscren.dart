import 'package:flutter/material.dart';

import 'homepage.dart';

class LoginScren extends StatefulWidget {
  const LoginScren({super.key});

  @override
  State<LoginScren> createState() => _LoginScrenState();
}

class _LoginScrenState extends State<LoginScren> {
  bool passwordVisible = true;
  var userController = TextEditingController();
  var passwordController = TextEditingController();
  bool userValidation = false;
  bool passwordvalidation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFf3f8fe),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Center(
                  child: Image.asset(
                    'assets/logo (1).png',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20, left: 20, top: 100),
                width: double.maxFinite,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 50,
                          blurStyle: BlurStyle.inner,
                          offset: Offset(00, 35),
                          color: Color.fromARGB(255, 229, 236, 248)),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Username",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 107, 107, 107)),
                      ),
                    ),
                    TextFormField(
                      controller: userController,
                      decoration: InputDecoration(
                          errorText: userValidation ? "Enter Vaild name" : null,
                          prefixIcon: Icon(Icons.person_2_outlined),
                          focusedBorder: InputBorder.none,
                          border: null,
                          enabledBorder: InputBorder.none),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                width: double.maxFinite,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 50,
                          blurStyle: BlurStyle.inner,
                          offset: Offset(00, 35),
                          color: Color.fromARGB(255, 229, 236, 248)),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 107, 107, 107)),
                      ),
                    ),
                    TextFormField(
                      obscureText: passwordVisible,
                      controller: passwordController,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                          errorText: passwordvalidation
                              ? 'Enter valid password'
                              : null,
                          prefixIcon: Icon(Icons.lock_outline_sharp),
                          focusedBorder: InputBorder.none,
                          suffixIcon: IconButton(
                            onPressed: () {
                              print('button is click ');
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                            icon: Icon(passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          border: null,
                          enabledBorder: InputBorder.none),
                    ),
                  ],
                ),
              ),
              Container(
                height: 60,
                width: double.maxFinite,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        userController.text.isEmpty
                            ? userValidation = true
                            : userValidation = false;
                        passwordController.text.isEmpty
                            ? passwordvalidation = true
                            : passwordvalidation = false;
                      });
                      if (userValidation == false &&
                          passwordvalidation == false) {
                        print("first conditon check");
                        if (passwordController.text.trim() == 'admin' &&
                            userController.text.trim() == 'admin') {
                          print("second conditon check");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Homepage(),
                              ));
                        }
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF3e4685),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Signup",
                      style: TextStyle(
                          color: Color.fromARGB(255, 75, 75, 75),
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Color.fromARGB(255, 75, 75, 75),
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
