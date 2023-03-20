import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_auth/ScreenS/homepage.dart';
import 'package:flutter_auth/ScreenS/optScreen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _numberController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  GoogleSignIn _googleSignIn = GoogleSignIn();
  Map<String, dynamic>? _userData;

  String welcome = "Facebook";
  Future<UserCredential> signInWithFacebook() async {
    final LoginResult result =
        await FacebookAuth.instance.login(permissions: ['email']);

    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData().then(
        (value) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => homepage(),
              ));
        },
      );

      _userData = userData;
    } else {
      print(result.message);
    }

    setState(() {
      welcome = _userData?['email'];
    });

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken!.token);

    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
  // fbLoginMethod() async {
  //   final LoginResult result = await FacebookAuth.instance
  //       .login(loginBehavior: LoginBehavior.deviceAuth, permissions: ['email']);

  //   if (result.status == LoginStatus.success) {
  //     final AccessToken accessToken = result.accessToken!;
  //     print("Login Success ${LoginStatus.success}");
  //     print("Login Success ${result.status}");

  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => homepage(),
  //         ));
  //   } else {
  //     print(result.status);
  //     print(result.message);
  //   }
  // }

  SignInWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    print("Id token>>${credential.idToken}");
    print("Accees Token>>>${credential.accessToken}");
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 190),
        child: Column(
          children: [
            Text(
              "ShopyS",
              style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 33, 151, 37)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: TextFormField(
                controller: _numberController,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                    hintText: 'Enter Number',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 15, 66, 16)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  print("${_numberController.text}");
                  _auth.verifyPhoneNumber(
                    timeout: Duration(seconds: 60),
                    phoneNumber: "+91${_numberController.text.toString()}",
                    verificationCompleted: (phoneAuthCredential) {},
                    verificationFailed: (error) {
                      print("Print Verification Failed notes:->$error");
                    },
                    codeSent: (verificationId, forceResendingToken) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OTPSCREEN(
                              VerificationToken: verificationId,
                            ),
                          ));
                    },
                    codeAutoRetrievalTimeout: (verificationId) {
                      print("Verification >>>${verificationId}");
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 50, 122, 53)),
                child: Text("Get OTP")),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      SignInWithGoogle().then((value) {
                        print("Next page is redy to go");
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => homepage(),
                            ),
                            (route) => false);
                      });
                    },
                    child: Container(
                      child: Image.network(
                        'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png',
                        height: 50,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("OR"),
                  ),
                  InkWell(
                    onTap: () {
                      signInWithFacebook();
                    },
                    child: Container(
                      child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/1024px-Facebook_Logo_%282019%29.png',
                        height: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
