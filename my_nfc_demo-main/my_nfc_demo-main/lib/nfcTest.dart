import 'dart:math';
import 'dart:typed_data';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_nfc_demo/homepage.dart';
import 'package:my_nfc_demo/readonly.dart';
import 'package:my_nfc_demo/scan.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'dart:convert' show utf8;

import 'package:url_launcher/url_launcher.dart';

class NfcTest extends StatelessWidget {
  NfcTest({Key? key}) : super(key: key);
  List imageUrl = [
    'https://uploads-ssl.webflow.com/60edc0a8835d5b38bf11f03f/61cf059cd8bcd32f34d51a75_Advantages-of-NFC-with-Their-Use-Cases.png',
    'https://cdn.mos.cms.futurecdn.net/93400fd03f1442834ac1c22ac11a951c.jpg',
    'https://nordvpn.com/wp-content/uploads/blog-NFC@2x.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                CarouselSlider.builder(
                    itemCount: imageUrl.length,
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(255, 206, 205, 205)),
                        child: Image.network('${imageUrl[index]}'),
                      );
                    },
                    options: CarouselOptions(
                      height: 200,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      onPageChanged: (index, reason) {
                        print("${index}");
                      },
                      scrollDirection: Axis.horizontal,
                    )),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => scanDevice()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(255, 174, 199, 255)),
                        child: Column(
                          children: [
                            Icon(Icons.pending_actions_rounded),
                            Text("Write Data")
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => readOny(),
                            ));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(255, 174, 199, 255)),
                        child: Column(
                          children: [
                            Icon(Icons.chrome_reader_mode),
                            Text("read Data")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 80),
                  child: Text(
                    "NFC (near-field communication), is a short-range(depending on hardware, usually around 3 cm–5 cm) wireless technology that allows your phone to act as a transit pass or a credit card, speedily transfer data, or instantly connect with Bluetooth devices like headphones or speakers.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 74, 98, 117)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 80),
                  child: Text(
                    "Version 1.0.0",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 74, 98, 117)),
                  ),
                ),
              ],
            )));
  }
}
