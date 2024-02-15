import 'package:flutter/material.dart';

class Setingpage extends StatelessWidget {
  const Setingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children: [
          ListTile(
            title: Text("dark mode"),
            leading: Icon(Icons.dark_mode),
          ),

          ListTile(
            title: Text("font size"),
            leading: Icon(Icons.dark_mode),
          ),

          ListTile(
            title: Text(""),
            leading: Icon(Icons.dark_mode),
          ),

          ListTile(
            title: Text("dark mode"),
            leading: Icon(Icons.dark_mode),
          )
        ],
      ),
    
    );
  }
}