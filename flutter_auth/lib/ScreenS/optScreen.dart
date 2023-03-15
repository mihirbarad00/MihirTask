import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'homepage.dart';

class OTPSCREEN extends StatefulWidget {
  String? phoneNumber;
  OTPSCREEN({super.key, this.phoneNumber});

  @override
  State<OTPSCREEN> createState() => _OTPSCREENState();
}

class _OTPSCREENState extends State<OTPSCREEN> {
  TextEditingController _otpController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String? smscode;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('PhoneNnumber Const..${widget.phoneNumber}');
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
              child: TextFormField(
                controller: _otpController,
                onChanged: (value) {
                  smscode = value;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Enter OTP',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 15, 66, 16)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    PhoneAuthCredential phoneAuthCredential =
                        PhoneAuthProvider.credential(
                            verificationId: widget.phoneNumber!,
                            smsCode: smscode!);

                    await _auth
                        .signInWithCredential(phoneAuthCredential)
                        .then((value) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => homepage()),
                          (route) => false);
                    });
                  } catch (e) {
                    print(">>>Try OTPs<<<");
                  }
                  print("${_otpController.text}");
                },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 50, 122, 53)),
                child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
