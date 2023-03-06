import 'package:flutter/material.dart';

import 'page2.dart';

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  List iconaList = [
    Icons.arrow_upward,
    Icons.arrow_downward,
    Icons.monetization_on_rounded,
    Icons.monetization_on_rounded,
  ];
  List titleList = [
    'Sent',
    'Receive',
    'Loan',
    'Loan',
  ];
  List pymentlist = [
    '\$150',
    '\$250',
    '\$450',
    '\$450',
  ];
  List subtitleList = [
    'sending payment to client',
    'Receiveing salary from comnpny',
    'Loan for the car',
    'Loan for the car',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 70),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 50,
                          offset: Offset(00, 35),
                          color: Color(0xFFe5ebf7)),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 255, 255, 255)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.merge_rounded)),
                      ],
                    ),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://cdn.hswstatic.com/gif/play/0b7f4e9b-f59c-4024-9f06-b3dc12850ab7-1920-1080.jpg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "Hira Riaz",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3e4685)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        "UX/UI Designer",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "\$8900",
                            style: TextStyle(
                                fontSize: 18, color: Color(0xFF3e4685)),
                          ),
                          Text(
                            "\$5500",
                            style: TextStyle(
                                fontSize: 18, color: Color(0xFF3e4685)),
                          ),
                          Text(
                            "\$890",
                            style: TextStyle(
                                fontSize: 18, color: Color(0xFF3e4685)),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Income",
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            "Expense",
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            "Loan",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Overview",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3e4685)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.notifications_none_outlined),
                    ],
                  ),
                  Text(
                    "sept 13,2020",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF3e4685)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: iconaList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => page2(),
                          ));
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 50,
                                offset: Offset(00, 35),
                                color: Color(0xFFe5ebf7)),
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 255, 255, 255)),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Color(0xFFe5e8f9),
                                borderRadius: BorderRadius.circular(13)),
                            child: Icon(
                              iconaList[index],
                              color: Color(0xFF3e4685),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${titleList[index]}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxHeight: 20,
                                      maxWidth: 150,
                                      minWidth: 150),
                                  child: Text(
                                    "${subtitleList[index]}",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 126, 124, 124),
                                        fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 80),
                            child: Text(
                              "${pymentlist[index]}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
