

class TreeViewModel {
  List<Lists>? lists;
  bool? status;
  String? code;
  String? errorMessage;

  TreeViewModel({this.lists, this.status, this.code, this.errorMessage});

  TreeViewModel.fromJson(Map<String, dynamic> json) {
    if (json['lists'] != null) {
      lists = <Lists>[];
      json['lists'].forEach((v) {
        lists!.add(new Lists.fromJson(v));
      });
    }
    status = json['Status'];
    code = json['Code'];
    errorMessage = json['ErrorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lists != null) {
      data['lists'] = this.lists!.map((v) => v.toJson()).toList();
    }
    data['Status'] = this.status;
    data['Code'] = this.code;
    data['ErrorMessage'] = this.errorMessage;
    return data;
  }
}

class Lists {
  int? id;
  String? name;
  String? code;
  int? level;
  String? gender;
  int? parentID;

  Lists(
      {this.id, this.name, this.code, this.level, this.gender, this.parentID});

  Lists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    level = json['level'];
    gender = json['gender'];
    parentID = json['parentID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['level'] = this.level;
    data['gender'] = this.gender;
    data['parentID'] = this.parentID;
    return data;
  }
}

// import 'dart:ui';
//
// import 'package:flutter/material.dart';
//
// //
// // Future<List<ComentModel>> fetchdata() async {
// //   // final response =
// //   //     await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos')); http for
// //
// //   final response =
// //   await Dio().get("https://jsonplaceholder.typicode.com/photos");
// //
// //   if (response.statusCode == 200) {
// //
// //     return List jsonResponce = response.data;
// //   } else {
// //     return ;
// //   }
// // }
//
// List dataList = [
//   {
//     "name": "Root child 1",
//     "icon": Icons.person,
//     "subMenu": [
//       {
//         "name": "child 1",
//         "icon": Icons.child_friendly,
//         "subMenu": [
//           {
//             "name": "boy 1",
//             "icon": Icons.boy,
//             "subMenu": [
//               {
//                 "name": "Girl 1",
//                 "icon": Icons.girl,
//                 "subMenu":[{"name":"girl1"},{"name":"boy 2"}]
//               },
//               {
//                 "name": "Girl 2",
//                 "icon": Icons.girl,
//                 "subMenu":[{"name":"girl1"},{"name":"girl 2"}]
//               }
//             ]
//           },
//           {
//             "name": "boy 2",
//             "icon": Icons.boy,
//             "subMenu": [
//               {"name": "Girl 1", "icon": Icons.girl, "subMenu": [
//                 {"name":"girl1"},{"name":"boy 2"}
//               ]},
//               {"name": "Girl 2", "icon": Icons.girl, "subMenu": [{"name":"girl1"},{"name":"girl 2"}]}
//             ]
//           }
//         ]
//       },
//       {
//         "name": "child 2 ",
//         "icon": Icons.child_friendly,
//         "subMenu": [
//           {"name": "boy 1", "icon": Icons.boy,
//             "subMenu":[
//               {
//                 "name":"girl 1","icon":Icons.girl,
//                 "subMenu":[
//                   {
//                     "name":"girl","icon":Icons.girl,
//                   },
//                   {
//                     "name":"boy","icon":Icons.boy,
//                   }
//                 ]
//               },
//               {
//                 "name":"girl 2","icon":Icons.girl,
//                 "subMenu":[
//                   {
//                     "name":"girl","icon":Icons.girl,
//                   },
//                   {
//                     "name":"boy","icon":Icons.boy,
//                   }
//                 ]
//               },
//             ]
//           },
//           {"name": "boy 2", "icon": Icons.boy,
//             "subMenu":[
//               {
//                 "name":"girl1","icon":Icons.girl,
//                 "subMenu":[
//                   {
//                     "name":"boy1","icon":Icons.boy,
//                   },
//                   {
//                     "name":"girl2","icon":Icons.girl,
//                   }
//                 ]
//               },
//               {
//                 "name":"girl 2","icon":Icons.girl,
//                 "subMenu":[
//                   {
//                   "name":"boy 1","icon":Icons.boy,
//                 },
//                   {
//                     "name":"girl1","icon":Icons.girl,
//                   }
//                 ]
//               },
//             ]
//           },
//         ]
//       },
//       {
//         "name": "child 3",
//         "icon": Icons.child_friendly,
//         "subMenu": [
//           {"name": "boy 1", "icon": Icons.boy,
//             "subMenu":[
//               {
//                 "name":"girl1","icon":Icons.girl,
//                 "subMenu":[
//                 {
//                   "name": "girl", "icon": Icons.girl,
//                 },
//                     {
//                       "name":"boy","icon":Icons.boy,
//                     }
//
//                 ]
//
//               },
//               {
//                 "name":"girl2","icon":Icons.girl,
//                 "subMenu":[
//                   {
//                     "name":"girl","icon":Icons.girl,
//                   },
//                   {
//                     "name":"boy","icon":Icons.boy,
//                   }
//                 ]
//
//               }
//             ]
//           },
//           {"name": "boy 2", "icon": Icons.boy,
//             "subMenu":[
//               {
//                 "name":"girl1","icon":Icons.girl,
//                 "subMenu":[
//                   {
//                     "name":"girl","icon":Icons.girl,
//                   },
//                   {
//                     "name":"boy","icon":Icons.boy,
//                   }
//                 ]
//               },
//               {
//                 "name": "girl2", "icon": Icons.girl,
//                 "subMenu":[
//                 {
//                   "name": "girl", "icon": Icons.girl,
//                 },
//                     {
//                       "name":"boy","icon":Icons.boy,
//                     },
//
//                 ]
//               }
//             ]
//           }
//         ]
//       },
//       {
//         "name": "child 4 ",
//         "icon": Icons.child_friendly,
//         "subMenu": [
//           {"icon": Icons.boy},
//           {"name": "boy 1", "icon": Icons.boy,
//             "subMenu":[
//               {
//                 "name":"girl1","icon":Icons.girl,
//                 "subMenu":[
//                   {
//                     "name":"girl","icon":Icons.girl,
//                   },
//                   {
//                     "name":"boy","icon":Icons.boy,
//                   }
//                 ]
//
//               },
//               {
//                 "name":"girl2","icon":Icons.girl,
//                 "subMenu":[
//                   {
//                     "name":"girl","icon":Icons.girl,
//                   },
//                   {
//                     "name":"boy","icon":Icons.boy,
//                   }
//                 ]
//               }
//             ]
//           },
//           {"name": "boy 2", "icon": Icons.boy,
//             "subMenu":[
//               {
//             "name":"girl1","icon":Icons.girl,
//                 "subMenu":[{
//               "name":"gir1","icon":Icons.girl,
//                 },
//                   {
//                     "name":"boy1","icon":Icons.boy,
//                   }
//                 ]
//               },
//               {
//               "name": "girl2", "icon": Icons.girl,
//                 "subMenu":[
//                   {
//                     "name":"girl1","icon":Icons.girl,
//                   },
//                   {
//                     "name":"boy1","icon":Icons.boy,
//                   }
//                 ]
//                },
//             ]
//           }
//         ]
//       }
//     ]
//   },
//   {
//     "name": "Root child 2",
//     "icon": Icons.person,
//     "subMenu": [
//       {
//         "name": "child 1",
//         "icon": Icons.child_friendly,
//         "subMenu": [
//           {"name": "boy 1", "icon": Icons.boy,
//             "subMenu":[{
//             "name":"girl1","icon":Icons.girl,
//               "subMenu":[
//                 {
//                   "name":"girl","icon":Icons.girl,
//                 },
//                 {
//                   "name":"boy","icon":Icons.boy,
//                 }
//               ]
//             },
//               {
//                 "name":"girl2","icon":Icons.girl,
//                 "subMenu":[
//                   {
//                     "name":"girl","icon":Icons.girl,
//                   },
//                   {
//                     "name": "boy", "icon": Icons.boy,
//                   }, ]
//               }
//             ]
//           },
//           {"name": "boy 2", "icon": Icons.boy,
//             "subMenu":[
//               {
//                 "name":"girl1","icon":Icons.girl,
//                 "subMenu":[
//                   {
//                     "name":"girl1","icon":Icons.girl,
//                   },
//                   {
//                     "name": "boy", "icon": Icons.boy,
//                   }]
//               },
//               {
//                 "name":"girl2","icon":Icons.girl,
//                 "subMenu":[
//                   {
//                     "name":"girl1","icon":Icons.girl,
//                   },{
//                     "name": "boy", "icon": Icons.boy,
//                   }
//                 ]
//               }
//             ]
//           }
//         ]
//       },
//
//     ]
//    }
//  ];
//
class Menu {
  var name;
  var icon;
  List<Menu> subMenu = [];

  Menu({required this.name, required this.subMenu, required this.icon});

  Menu.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    if (json['subMenu'] != null) {
      subMenu.clear();
      json['subMenu'].forEach((v) {
        subMenu.add(new Menu.fromJson(v));
      });
    }}}
