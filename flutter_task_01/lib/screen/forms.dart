import 'package:flutter/material.dart';

class forms extends StatefulWidget {
  const forms({super.key});

  @override
  State<forms> createState() => _formsState();
}

class _formsState extends State<forms> {
  final _formkey = GlobalKey<FormState>();
  bool? numbervalidation = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 51, 52, 116),
          centerTitle: true,
          elevation: 10,
          title: Text("Login Page"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Valid Name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hintText: 'Name',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (numbers) {
                        int? nums = int.parse(numbers.toString());
                        if (numbers == null) {
                          print("number isnot emty");
                          return 'please enter  number';
                        }
                        if (nums <= 4999 || nums >= 10001) {
                          print("data added $nums");

                          return 'Please enter greter then 5k & less than 10K ';
                        }
                        return null;
                      },
                      controller: numberController,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          labelStyle: TextStyle(color: Colors.black),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          errorText: numbervalidation! ? "req.. feild" : null,
                          hintText: 'Number',
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: double.maxFinite,
                    margin: EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(00, 50),
                          primary: Color.fromARGB(255, 51, 52, 116),
                        ),
                        onPressed: () {
                          setState(() {
                            numberController.text.isNotEmpty
                                ? numbervalidation = false
                                : numbervalidation = true;
                          });
                          if (_formkey.currentState!.validate()) {
                            print("main data are lodede");
                          }
                        },
                        child: Text('Save')),
                  )
                ],
              )),
        ));
  }
}
