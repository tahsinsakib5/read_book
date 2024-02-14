import 'package:flutter/material.dart';
import 'package:testprovider/englishLearnapp/allvocavolary.dart';
import 'package:testprovider/englishLearnapp/homepage.dart';
import 'package:testprovider/englishLearnapp/vocavolary.dart';

class Bontonnavigationread extends StatefulWidget {
   Bontonnavigationread({super.key});

  @override
  State<Bontonnavigationread> createState() => _BontonnavigationreadState();
}

class _BontonnavigationreadState extends State<Bontonnavigationread> {
  List pages =[HomePageReadBook(),Vocavolary(),allvocavolary()];

 int curentindex =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book),label: "Vocavolary"),
          BottomNavigationBarItem(icon: Icon(Icons.book_outlined),label: "seting")
        ],
         onTap: (index) {
          setState(() {
            
          });
           curentindex=index;
         },
        ),
         body: pages[curentindex],
        
    );
  }
}