import 'package:flutter/material.dart';
import 'package:treeview/expandedview.dart';

import 'NewModel.dart';

class Expandedview extends StatefulWidget {
  @override
  State<Expandedview> createState() => _MyAppState();
}

class _MyAppState extends State<Expandedview> {
  List<menu> data = [];
  @override
  void initState() {
    dataList.forEach((element) {
      data.add(menu.fromJson(element));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: _drawer(data),
        appBar: AppBar(
          title: const Text('Treeview Example'),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 40),
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) =>
                _buildList(data[index]),
          ),
        ),
      ),
    );
  }

  Widget _drawer(List<menu> data) {
    return Drawer(
        child: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                margin: EdgeInsets.only(bottom: 0.0),
                accountName: Text('drashti'),
                accountEmail: Text('vekariyadrashti8@gmail.com')),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return _buildList(data[index]);
              },
            )
          ],
        ),
      ),
    ));
  }

  Widget _buildList(menu list) {
    if (list.children.isEmpty)
      return Builder(builder: (context) {
        return Container(
          margin: EdgeInsets.only(left: 100),
          padding: EdgeInsets.only(top: 10),
          child: ListTile(
            onTap: () {
              print("data printed");
            },
            leading: SizedBox(),
            title: Text(
              list.name,
            ),
            textColor: Colors.cyan,
          ),
        );
      });
    return Container(
      margin: EdgeInsets.only(top: 20, left: 15),
      child: Container(
        child: ExpansionTile(
          title: Text(
            list.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          children: list.children.map(_buildList).toList(),
        ),
      ),
    );
  }
}
