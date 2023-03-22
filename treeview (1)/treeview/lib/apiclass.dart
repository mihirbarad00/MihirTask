import 'dart:convert';

import 'package:http/http.dart';

import 'Datamodel.dart';

class apiclass{
  String url="https://gmpsapi.netpairsoftware.com/api/Selter/GetFamilyTree";



  Future<TreeViewModel>? getsharing() async {
    Response res =
    await get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',

    });
    if (res.statusCode == 200) {
      print(res.statusCode);
      print(res.body);
      return TreeViewModel.fromJson(json.decode(res.body));
    } else {
      throw 'Data not retrieve';
    }
  }

}