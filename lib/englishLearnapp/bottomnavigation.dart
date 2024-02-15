import 'package:flutter/material.dart';
import 'package:testprovider/englishLearnapp/allvocavolary.dart';
import 'package:testprovider/englishLearnapp/homepage.dart';
import 'package:testprovider/englishLearnapp/stingpage.dart';
import 'package:testprovider/englishLearnapp/vocavolary.dart';

class Bontonnavigationread extends StatefulWidget {
   Bontonnavigationread({super.key});

  @override
  State<Bontonnavigationread> createState() => _BontonnavigationreadState();
}

class _BontonnavigationreadState extends State<Bontonnavigationread> {
  List pages =[HomePageReadBook(),Vocavolary(),allvocavolary(),Setingpage()];

 int curentindex =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       bottomNavigationBar: BottomNavigationBar(backgroundColor:Colors.pink,items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.pink,),label:"Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book,color: Colors.pink,),label: "Vocavolary"),
          BottomNavigationBarItem(icon: Icon(Icons.book_outlined,color: Colors.pink,),label: "seting"),
          BottomNavigationBarItem(icon: Icon(Icons.book_outlined,color: Colors.pink,),label: "seting")
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