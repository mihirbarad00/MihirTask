import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';
import 'package:http/http.dart' as http;
import 'package:treeview/mytry/treeview_model.dart';

class apiTreeView extends StatefulWidget {
  const apiTreeView({super.key});

  @override
  State<apiTreeView> createState() => _apiTreeViewState();
}

Future<TreeviewModel> fetchdata() async {
  final response = await http.get(Uri.parse(
      'https://gmpsapi.netpairsoftware.com/api/Selter/GetFamilyTree'));
  print("${response.body}");
  var data = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {
    return TreeviewModel.fromJson(data);
  } else {
    throw Exception("Failed to Load album");
  }
}

class _apiTreeViewState extends State<apiTreeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<TreeviewModel>(
          future: fetchdata(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.lists!.length,
                itemBuilder: (context, index) {
                  TreeView(nodes: [
                    TreeNode(
                      content: Text("${snapshot.data!.lists![index].name}"),
                      children: [
                        TreeNode(content: Text("child21")),
                        TreeNode(
                          children: [
                            TreeNode(content: Text("child231")),
                          ],
                        ),
                      ],
                    ),
                  ]);
                },
              );
            } else if (snapshot.hasError) {}
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
