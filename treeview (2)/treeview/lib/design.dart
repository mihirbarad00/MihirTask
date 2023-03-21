import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:treeview/Datamodel.dart';
import 'package:treeview/apiclass.dart';

class ExpandedView extends StatefulWidget {
  const ExpandedView({Key? key}) : super(key: key);

  @override
  State<ExpandedView> createState() => _ExpandedViewState();
}

class _ExpandedViewState extends State<ExpandedView> {
  List<Lists> listdata = [];

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: _drawer( ),
        appBar: AppBar(
          title: const Text('Treeview Example'),
        ),
        body: ListView.builder(
            itemCount: listdata.length,
            itemBuilder: (context, position) {
              return Container(
                child: Column(
                  children: [
                    listdata[position].parentID == null
                        ? Row(
                            children: [
                              Text(listdata[position].id.toString()),
                              Text("=null")
                            ],
                          )
                        : Text("")
                  ],
                ),
              );
            }));
  }

  // Widget _drawer(List<Menu> data) {
  //   return Drawer(
  //       child: SafeArea(
  //         child: SingleChildScrollView(
  //           child: Column(
  //             children: [
  //               UserAccountsDrawerHeader(
  //                   margin: EdgeInsets.only(bottom: 0.0),
  //                   accountName: Text('drashti'),
  //                   accountEmail: Text('vekariyadrashti8@gmail.com')),
  //               ListView.builder(
  //                 shrinkWrap: true,
  //                 physics: NeverScrollableScrollPhysics(),
  //                 itemCount: data.length,
  //                 itemBuilder: (context, index) {
  //                   return _buildList(data[index]);
  //                 },
  //               )
  //             ],
  //           ),
  //         ),
  //       ));
  // }
  //
  // Widget _buildList(Lists data) {
  //   if (data.id != null)
  //     return Builder(builder: (context) {
  //       return Container(
  //         margin: EdgeInsets.only(left: 80),
  //         child: ListTile(
  //           onTap: () {
  //             print("data printed");
  //           },
  //           title: Text(
  //             data.level.toString(),
  //           ),
  //           textColor: Colors.cyan,
  //         ),
  //       );
  //     });
  //   return Container(
  //     margin: EdgeInsets.only(top: 30, left: 20),
  //     child: ExpansionTile(
  //       title: Row(
  //         children: [
  //         //  Icon(data.),
  //           Text(
  //             data!.level!,
  //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //           ),
  //         ],
  //       ),
  //       children: data.subMenu.map(_buildList).toList(),
  //     ),
  //   );
  // }

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
 


// class Expandedview extends StatefulWidget
// class ExpandedView extends StatefulWidget {
//   const ExpandedView({Key? key}) : super(key: key);
//
//   @override
//   State<ExpandedView> createState() => _ExpandedViewState();
// }
//
// class _ExpandedViewState extends State<ExpandedView> {
//   @override
//   Widget build(BuildContext context) {
//
//   ;
//   // List<Menu> data = [];
//   @override
//   void initState() {
//    future =  CustomDioInterceptor.get
//     // dataList.forEach((element) {
//     //   data.add(Menu.fromJson(element));
//     // });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//
