import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_01/screen/model.dart';

import 'api_model.dart';

class DioEExmaple extends StatefulWidget {
  const DioEExmaple({super.key});

  @override
  State<DioEExmaple> createState() => _DioEExmapleState();
}

class _DioEExmapleState extends State<DioEExmaple> {
  final dio = Dio();
  List<dynamic> fetchData = [];

  void GetDataFunction() async {
    final response =
        await Dio().get('https://jsonplaceholder.typicode.com/photos');
    print(response.toString());
    if (response.statusCode == 200) {
      List<dynamic> dataList = response.data
          .map<ApiModel>((data) => ApiModel.fromJson(data))
          .toList();
      setState(() {
        fetchData = dataList;
      });
      print("....................1>>${fetchData}");
      print("....................2>>${response.data}");
    } else {
      throw Exception("No data dounda");
    }
  }

  @override
  void initState() {
    GetDataFunction();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: fetchData.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('${fetchData[index].url}'))),
          ),
        );
      },
    ));
  }
}
