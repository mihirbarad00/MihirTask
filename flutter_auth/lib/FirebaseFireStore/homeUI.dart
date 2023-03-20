// main.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  final CollectionReference _productss =
      FirebaseFirestore.instance.collection('products');

  Future<void> _create([mydata]) async {
    String action = 'create';
    print(">>>>DocSnapshort>>>>>$mydata");
    if (mydata != null) {
      action = 'update';
      _nameController.text = mydata['name'];
      _priceController.text = mydata['price'].toString();
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            Form(
                key: _formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            labelStyle: TextStyle(color: Colors.black),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            hintText: 'Name',
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Valid Name';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        controller: _priceController,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            labelStyle: TextStyle(color: Colors.black),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            hintText: 'price',
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Valid Price';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text('Add'),
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      final String? name = _nameController.text;
                      final double? price =
                          double.tryParse(_priceController.text);
                      if (name != null && price != null) {
                        if (action == 'create') {
                          await _productss.add({"name": name, "price": price});
                        }

                        if (action == 'update') {
                          await _productss
                              .doc(mydata!.id)
                              .update({"name": name, "price": price});
                        }
                        setState(() {
                          _nameController.text = '';
                          _priceController.text = '';
                        });

                        Navigator.of(context).pop();
                      }
                    }
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Close")),
              ],
            )
          ],
        );
      },
    );
  }

  Future<void> _deleteProduct(productId) async {
    await _productss.doc(productId).delete().then((value) =>
        Fluttertoast.showToast(
            msg: "Data deleted",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Color.fromARGB(255, 27, 138, 146),
            textColor: Colors.white,
            fontSize: 16.0));
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 216, 214, 214),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 27, 138, 146),
        title: const Text('Firebase FireStore'),
      ),
      body: StreamBuilder(
        stream: _productss.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var mydata = snapshot.data!.docs[index];
                var total = mydata['price'];

                print(">>>>HomeUI>>>>>>${total}");

                if (snapshot.data!.docs.length > 0) {
                  return Card(
                    borderOnForeground: true,
                    color: Color.fromARGB(255, 253, 248, 230),
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(
                        '${mydata['name']}'.toUpperCase(),
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w400),
                      ),
                      subtitle: Text("₹${mydata['price'].toString()}"),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () => _create(mydata)),
                            IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => _deleteProduct(mydata.id)),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: Text("Data Is Empty"),
                  );
                }
              },
            );
          } else if (snapshot.hasError) {
            return Container(
              child: Text("Data Not Found"),
            );
          } else {
            return Container(
              child: Center(child: Text("Data Not Found")),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _create(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
