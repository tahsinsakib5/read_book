// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:testprovider/englishLearnapp/allvocavolary.dart';
import 'package:testprovider/englishLearnapp/forshowingsir.dart';
import 'package:testprovider/englishLearnapp/homepage.dart';
import 'package:testprovider/englishLearnapp/setingpage.dart';
import 'package:testprovider/pop_over_test.dart';

class Bontonnavigationread extends StatefulWidget {
  Bontonnavigationread({super.key});

  @override
  State<Bontonnavigationread> createState() => _BontonnavigationreadState();
}

class _BontonnavigationreadState extends State<Bontonnavigationread> {
  List pages = [
    HomePageReadBook(),
    allvocavolary(),
    PopoverExample(),

    // Setingpage()
  ];

  int curentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.pink,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.book_outlined,
                color: Colors.pink,
              ),
              label: "vocavlary"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.book_outlined,
                color: Colors.pink,
              ),
              label: "seting")
        ],
        onTap: (index) {
          setState(() {});
          curentindex = index;
        },
      ),
      body: pages[curentindex],
    );
  }
}
