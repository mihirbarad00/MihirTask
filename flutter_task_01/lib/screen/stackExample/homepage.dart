import 'package:flutter/material.dart';
import 'package:flutter_task_01/screen/stackExample/page1.dart';
import 'package:flutter_task_01/screen/stackExample/page2.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int pageIndex = 0;
  final pages = [
    page1(),
    Center(child: Text('2 pages')),
    Center(child: Text('3 pages')),
    Center(child: Text('4 pages')),
    Center(child: Text('5 pages')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 239, 250),
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? const Icon(
                      Icons.home_outlined,
                      color: Color.fromARGB(255, 109, 108, 108),
                      size: 25,
                    )
                  : const Icon(
                      Icons.home_outlined,
                      color: Color.fromARGB(255, 109, 108, 108),
                      size: 25,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? const Icon(
                      Icons.card_giftcard,
                      color: Color.fromARGB(255, 109, 108, 108),
                      size: 25,
                    )
                  : const Icon(
                      Icons.work_outline_outlined,
                      color: Color.fromARGB(255, 109, 108, 108),
                      size: 25,
                    ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFF3e4685),
                  borderRadius: BorderRadius.circular(15)),
              child: IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                icon: pageIndex == 2
                    ? const Icon(
                        Icons.add,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 25,
                      )
                    : const Icon(
                        Icons.add,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 25,
                      ),
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              icon: pageIndex == 3
                  ? const Icon(
                      Icons.monetization_on,
                      color: Color.fromARGB(255, 109, 108, 108),
                      size: 25,
                    )
                  : const Icon(
                      Icons.monetization_on,
                      color: Color.fromARGB(255, 109, 108, 108),
                      size: 25,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 4;
                });
              },
              icon: pageIndex == 4
                  ? const Icon(
                      Icons.person_pin_rounded,
                      color: Color.fromARGB(255, 109, 108, 108),
                      size: 25,
                    )
                  : const Icon(
                      Icons.person_pin_rounded,
                      color: Color.fromARGB(255, 109, 108, 108),
                      size: 25,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
