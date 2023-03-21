import 'package:flutter/material.dart';

List dataList = [
  {
    "name": "Root child 1",
    "children": [
      {
        "name": "child 1",
        //"icon":Icons.pages_rounded,
        "children": [
          {"name": "boy 1"},
          {"name": "boy 2"}
        ]
      },
      {
        "name": "child 2 ",
        "children": [
          {"name": "boy 1"},
          {"name": "boy 2"},
        ]
      },
      {
        "name": "child 3",
        "children": [
          {"name": "boy 1"},
          {"name": "boy 2"}
        ]
      },
      {
        "name": "child 4 ",
        "children": [
          {"name": "boy 1"},
          {"name": "boy 2"}
        ]
      }
    ]
  },
  {
    "name": "Root child 2",
    "children": [
      {
        "name": "child 1",
        //"icon": Icons.person,
        "children": [
          {"name": "boy 1"},
          {"name": "boy 2"}
        ]
      },
      {
        "name": "child 2 ",
        "children": [
          {"name": "boy 1"},
          {"name": "boy 2"},
        ]
      },
      {
        "name": "child 3",
        "children": [
          {"name": "boy 1"},
          {"name": "boy 2"}
        ]
      },
      {
        "name": "child 4 ",
        "children": [
          {"name": "boy 1"},
          {"name": "boy 2"}
        ]
      }
    ]
  }
];

// class Menu {
//   var name;
//   var icon;
//   List<Menu> subMenu = [];

//   Menu({required this.name, required this.subMenu, required this.icon});

//   Menu.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     icon = json['icon'];
//     if (json['subMenu'] != null) {
//       subMenu.clear();
//       json['subMenu'].forEach((v) {
//         subMenu.add(new Menu.fromJson(v));
//       });
//     }
//   }
// }
class menu {
  final int? id;
  final String name;
  List<menu> children = [];

  menu({required this.id, required this.name, required this.children});

  factory menu.fromJson(Map<String, dynamic> json) {
    return menu(
      id: json['id'],
      name: json['name'],
      children: (json['children'] as List<dynamic>)
          .map((child) => menu.fromJson(child))
          .toList(),
    );
  }
}
