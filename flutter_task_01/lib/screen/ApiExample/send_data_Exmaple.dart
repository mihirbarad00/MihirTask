import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_01/screen/ApiExample/Internet_check.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'auth_model.dart';

class Send_Data extends StatefulWidget {
  const Send_Data({Key? key}) : super(key: key);

  @override
  State<Send_Data> createState() => _Send_DataState();
}

class _Send_DataState extends State<Send_Data> {
  bool? checkBoxValue;
  int? errordispley = 0;
  bool? networkError;
  Map _source = {ConnectivityResult.none: false};
  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;
  String string = '';
  @override
  void initState() {
    super.initState();
    _networkConnectivity.initialise();
    _networkConnectivity.myStream.listen((source) {
      _source = source;
      print('source $_source');
      switch (_source.keys.toList()[0]) {
        case ConnectivityResult.mobile:
          networkError = _source.values.toList()[0] ? true : false;
          break;
        case ConnectivityResult.wifi:
          networkError = _source.values.toList()[0] ? true : false;
          break;
        case ConnectivityResult.none:
        default:
          networkError = false;
      }

      setState(() {});
    });
  }

  Future<AuthModel?> senddata() async {
    try {
      var Url = Uri.parse(
          'https://oasiswebportal.oasismovement.in/api/v1/yearlygoals/fetch_yearly_goals_list');
      final response = await http.get(Url, headers: {
        "Authorization":
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMyIsImZpcnN0X25hbWUiOiJBZG1pbiBDZW50cmFsIiwibGFzdF9uYW1lIjoiQWRtaW4iLCJlbWFpbCI6IiIsInRpbWVTdGFtcCI6IjIwMjMtMDMtMTcgMDU6NTI6MTAifQ.mONWAP_J0EwkP4Ww9klTKe9jsWbeRoxj4OmXw3MxwgI",
        "Cookie": "ci_session=fbl23daoe2ghqf3prmo365eb3t2iqemo",
      });
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return AuthModel.fromJson(data);
      } else {
        setState(() {
          errordispley = 1;
        });

        Fluttertoast.showToast(
            msg: "Authorization failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Color.fromARGB(255, 21, 29, 21),
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      setState(() {
        errordispley = 2;
      });
      Fluttertoast.showToast(
          msg: "Data Not Found",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Color.fromARGB(255, 21, 29, 21),
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  void dispose() {
    _networkConnectivity.disposeStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (networkError == true) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 26, 34, 28),
            title: Text("API EXMAPLEs"),
          ),
          body: RefreshIndicator(
            onRefresh: () {
              return senddata();
            },
            child: errordispley == 0
                ? FutureBuilder<AuthModel?>(
                    future: senddata(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount:
                              snapshot.data!.message!.yearlygoalslist!.length,
                          itemBuilder: (context, index) {
                            checkBoxValue = snapshot.data!.message!
                                        .yearlygoalslist![index].isChecked ==
                                    '0'
                                ? false
                                : true;
                            return ListTile(
                              leading: Checkbox(
                                value: checkBoxValue!,
                                activeColor: Color.fromARGB(255, 63, 99, 87),
                                onChanged: (value) {
                                  setState(() {
                                    checkBoxValue != value;
                                  });
                                },
                              ),
                              title: Text(
                                  "${snapshot.data!.message!.yearlygoalslist![index].programName}"),
                              subtitle: Text(
                                  "id: ${snapshot.data!.message!.yearlygoalslist![index].programId}"),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {}
                      return Center(child: CircularProgressIndicator());
                    },
                  )
                : errordispley == 1
                    ? Center(
                        child: Text("Authoraize Failed "),
                      )
                    : Center(
                        child: Text("data Not Found Failed "),
                      ),
          ));
    } else {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/internet.png'),
            Text("Check Your Cannection",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.w500))
          ],
        ),
      );
    }
  }
}
