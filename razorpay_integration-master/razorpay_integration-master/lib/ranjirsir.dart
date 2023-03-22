import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:razorpay_intergration/model/razorpay_response_model.dart';
import 'package:http/http.dart' as http;

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Razorpay? _razorpay;
  TextEditingController amount = TextEditingController();

  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    Fluttertoast.showToast(msg: " Payment Successfully");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "Payment failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "Payment Successfully");
  }

  Future<RazorpayOrderResponse?> createOrder() async {
    var mapHeader = <String, String>{};
    mapHeader['Authorization'] =
        "Basic cnpwX2xpdmVfUlF6dmV4M0tLUWFlWEk6ckwwSE9rS251Q3dyRVVvZUdmTUttYVhy";
    mapHeader['Accept'] = "application/json";
    mapHeader['Content-Type'] = "application/x-www-form-urlencoded";
    // var map = <String, String>{};
    // setState(() {
    //   map['amount'] = "${amount.text}";
    // });
    // map['currency'] = "INR";
    // map['receipt'] = "receipt1";
    // print("map $map");

    var map = {
      "amount": 1000000.toString(),
      "currency": "INR",
      "receipt": "Receipt no. 1",
      "notes": {
        "notes_key_1": "Tea, Earl Grey, Hot",
        "notes_key_2": "Tea, Earl Grey… decaf."
      }
    };

    var response = await http.post(
        Uri.parse("https://api.razorpay.com/v1/orders"),
        body: jsonEncode(map));
    print("Create order response" + response.body);
    if (response.statusCode == 200) {
      print('Response success');
      RazorpayOrderResponse data =
          RazorpayOrderResponse.fromJson(json.decode(response.body));

      openCheckout(data);
    } else {
      Fluttertoast.showToast(msg: "Something went wrong!");
    }
  }

  void openCheckout(RazorpayOrderResponse data) async {
    var options = {
      'key': 'rzp_live_RQzvex3KKQaeXI',
      'amount': 5000,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'name': 'Mihir Barad',
      'description': '',
      'order_id': '${data.id}',
    };

    try {
      _razorpay?.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Razorpay integration"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: amount,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                  hintText: "Amount"),
            ),
          ),
          ElevatedButton.icon(
              onPressed: () => createOrder(),
              icon: Icon(Icons.arrow_forward_sharp),
              label: Text("PAY"))
        ],
      ),
    );
  }
}
