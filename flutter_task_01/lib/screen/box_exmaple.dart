import 'package:flutter/material.dart';

class boxExmaple extends StatelessWidget {
  const boxExmaple({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 219, 232, 243),
      appBar: AppBar(
        elevation: 20,
        title: Text('Box Exmaple'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              height: 120,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  'Container',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Container(color: Colors.amber, child: Text("Sizedbox")),
            ),
            Container(
              height: 20,
              width: 50,
              color: Colors.amber,
              child: const FittedBox(
                child: Text(" This Is  askjdjks jksadh "),
              ),
            ),
            ConstrainedBox(
                child: Container(
                  width: 60,
                  color: Colors.black,
                  child: Text(
                    ' i asdsadsa  sadasd asdsd asdasda sadasdasd sad sda asdasd',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                constraints: BoxConstraints(
                    maxHeight: 80, maxWidth: 50, minHeight: 50, minWidth: 50)),
            LimitedBox(
              maxHeight: 220,
              maxWidth: 200,
              child:
                  Container(height: 500, child: Image.asset('assets/pizz.jpg')),
            )
          ],
        ),
      ),
    );
  }
}
