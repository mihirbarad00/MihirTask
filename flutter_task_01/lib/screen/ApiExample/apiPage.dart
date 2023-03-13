import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'api_model.dart';

class ApiExample extends StatefulWidget {
  const ApiExample({super.key});

  @override
  State<ApiExample> createState() => _ApiExampleState();
}

Future<List<ApiModel>> fetchData() async {
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));

  if (response.statusCode == 200) {
    List Jsonresponse = jsonDecode(response.body);
    return Jsonresponse.map((data) => new ApiModel.fromJson(data)).toList();
  } else {
    return throw Exception('Data Not Found ');
  }
}

class _ApiExampleState extends State<ApiExample> {
  Future<List<ApiModel>>? fetchLists;

  @override
  void initState() {
    super.initState();
    fetchLists = fetchData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 44, 95, 46),
        title: Text("Json Parseing API"),
      ),
      body: FutureBuilder<List<ApiModel>>(
        future: fetchLists,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ApiModel> mylist = snapshot.data!;
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: mylist.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ShowImages(url: mylist[index].url.toString()),
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                NetworkImage('${mylist[index].thumbnailUrl}'))),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {}
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class ShowImages extends StatefulWidget {
  String? url;
  ShowImages({super.key, this.url});

  @override
  State<ShowImages> createState() => _ShowImagesState();
}

class _ShowImagesState extends State<ShowImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.network(
        '${widget.url}',
        height: double.maxFinite,
      )),
    );
  }
}
