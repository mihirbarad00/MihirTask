import 'dart:async';
import 'dart:convert';
import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_01/screen/future&Stream/product_model.dart';
import 'package:http/http.dart' as http;

class StreamEx extends StatefulWidget {
  const StreamEx({super.key});

  @override
  State<StreamEx> createState() => StreamExState();
}

class StreamExState extends State<StreamEx> {
  StreamController<ProductModel> _controller = StreamController();

  Future<ProductModel?> GetdataAPI() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));
    final databody = json.decode(response.body.toString());
    if (response.statusCode == 200) {
      ProductModel dataModel = new ProductModel.fromJson(databody);
      _controller.sink.add(dataModel);
      return dataModel;
    } else {
      ProductModel dataModel = new ProductModel.fromJson(databody);
      _controller.sink.add(dataModel);
      return dataModel;
    }
  }

  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      GetdataAPI();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<ProductModel>(
          stream: _controller.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.products!.length,
                itemBuilder: (context, index) {
                  return Container(
                      child: Image.network(
                          '${snapshot.data!.products![index].thumbnail}'));
                },
              );
            } else if (snapshot.hasError) {
              throw Exception("Has not a data");
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
