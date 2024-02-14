import 'package:flutter/material.dart';

class Shopepage extends StatelessWidget {
  const Shopepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Colors.amber,
      
        body: Column(
          children: [
           ElevatedButton(onPressed: () {
             PopupMenuItem(child: Text("sakib"),);
           }, child:Text("save"))
          ],
        ),
      ),
    );
  }
}