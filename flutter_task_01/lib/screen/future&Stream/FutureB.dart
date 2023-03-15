import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_task_01/screen/future&Stream/product_model.dart';
import 'package:http/http.dart' as http;

class FutureExmaple extends StatefulWidget {
  const FutureExmaple({super.key});

  @override
  State<FutureExmaple> createState() => _FutureExmapleState();
}

class _FutureExmapleState extends State<FutureExmaple> {
  Future<ProductModel> getDataApi() async {
    final response =
        await http.get(Uri.parse("https://dummyjson.com/products"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return ProductModel.fromJson(data);
    } else {
      return throw Exception("Data Not Found");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ShopingWala"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.topLeft,
                colors: <Color>[
                  Color.fromARGB(255, 77, 59, 7),
                  Color.fromARGB(255, 212, 183, 95),
                ]),
          ),
        ),
      ),
      body: FutureBuilder<ProductModel>(
        future: getDataApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.products!.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 121, 94, 13),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Image.network(
                        "${snapshot.data!.products![index].thumbnail}",
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${snapshot.data!.products![index].title}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "\$${snapshot.data!.products![index].price}",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${snapshot.data!.products![index].description}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {}
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
