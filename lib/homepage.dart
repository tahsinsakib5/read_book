import 'package:flutter/material.dart';
import 'package:testprovider/cardpage.dart';
import 'package:testprovider/personpage.dart';
import 'package:testprovider/secondhomepage.dart';
import 'package:testprovider/shopepage.dart';


class Homepage extends StatefulWidget {
Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List pages =[Shopepage(),cardpage(),personpage(),Secodhomepage()];

  int curentindex =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:BottomNavigationBar(
        
        
        selectedItemColor:Colors.grey,      
        unselectedItemColor: Colors.black,
      
      items:[
        BottomNavigationBarItem(icon:Icon(Icons.home),label:"home"),
        BottomNavigationBarItem(icon:Icon(Icons.card_giftcard),label:"card"),
        BottomNavigationBarItem(icon:Icon(Icons.shop),label:"shop"),
        BottomNavigationBarItem(icon:Icon(Icons.person),label:"person"),
      ],
       onTap: (index) {
        setState(() {
          
        });
         curentindex=index;
       },
      ),
      body:pages[curentindex],
    );
  }
}