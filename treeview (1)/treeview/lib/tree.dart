import 'package:flutter/material.dart';
import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';
import 'package:treeview/Datamodel.dart';
import 'package:treeview/apiclass.dart';

class TreeViewEx extends StatefulWidget {
  const TreeViewEx({super.key});

  @override
  State<TreeViewEx> createState() => _TreeViewExState();
}

class _TreeViewExState extends State<TreeViewEx> {
  List<Lists> listdata = [];
  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text(
            "TreeView",
            style: TextStyle(color: Colors.yellow, fontSize: 25),
          ),
        ),
        body: ListView.builder(
            itemCount: listdata.length,
            itemBuilder: (context, position) {
              String namemain = listdata[position].name!;
              String idmain = listdata[position].id.toString();
              String levelmain = listdata[position].level.toString();
              String id = listdata[position].id.toString();
              String level = listdata[position].level.toString();
              return listdata[position].parentID == null
                  ?
                  // listdata[position].parentID==1?
                  TreeView(
                      iconSize: 26,
                      nodes: [
                        //main root child 1
                        TreeNode(
                          content: Center(
                              child: Container(
                            margin: EdgeInsets.only(
                              top: 10,
                            ),
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 5, 52, 67),
                                borderRadius: BorderRadius.circular(18)),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                Text(
                                  "${namemain}${"(id=$id"},${"level=$level)"}",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )),
                          children: [
                            TreeNode(
                              content: Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(
                                  top: 10,
                                ),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 69, 44, 35),
                                    borderRadius: BorderRadius.circular(18)),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                    listdata[position].parentID == 1
                                        ? Text(
                                            "${"(id=$id"},${"level=$level)"}",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        : Text("data")
                                  ],
                                ),
                              ),
                              children: [
                                TreeNode(
                                    content: Container(
                                      padding: EdgeInsets.all(6),
                                      margin: EdgeInsets.only(
                                          right: 10, bottom: 4, top: 3),
                                      decoration: BoxDecoration(
                                          color: Colors.brown,
                                          borderRadius:
                                              BorderRadius.circular(18)),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.person,
                                            color: Colors.white,
                                          ),
                                          listdata[position].parentID == 1
                                              ? Text(
                                                  listdata[position]
                                                      .id
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                )
                                              : Text("")
                                        ],
                                      ),
                                    ),
                                    children: [
                                      TreeNode(
                                          content: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(6),
                                                margin: EdgeInsets.all(6),
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        160, 69, 44, 35),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18)),
                                                child: Column(
                                                  children: [
                                                    Icon(
                                                      Icons.person,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                      "boy  1",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(6),
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        160, 69, 44, 35),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18)),
                                                child: Column(
                                                  children: [
                                                    Icon(
                                                      Icons.person,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                      "boy  2",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      )),
                                    ]),
                                TreeNode(
                                    content: Container(
                                      padding: EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                          color: Colors.brown,
                                          borderRadius:
                                              BorderRadius.circular(18)),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.person,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            " Child 2",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    children: [
                                      TreeNode(
                                          content: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(6),
                                                margin: EdgeInsets.all(6),
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        160, 69, 44, 35),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18)),
                                                child: Column(
                                                  children: [
                                                    Icon(
                                                      Icons.person,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                      "boy  1",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(6),
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        160, 69, 44, 35),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18)),
                                                child: Column(
                                                  children: [
                                                    Icon(
                                                      Icons.person,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                      "boy  2",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      )),
                                    ])
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  : Text("");
            }));
  }

  void apicall() async {
    apiclass httpService = apiclass();
    // SessionManagement sessionManagment = SessionManagement();
    // Login login = await sessionManagment.getmodel('Login');
    //String? token  = login.token;
    dynamic response = await httpService.getsharing();
    if (response.status) {
      TreeViewModel time = response;
      List<Lists>? list = time.lists;
      setState(() {
        listdata = list!;
      });
    } else {}
  }
}
