

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprovider/englishLearnapp/readpage.dart';
import 'package:testprovider/englishLearnapp/them.dart';

class Setingpage extends StatefulWidget {
  const Setingpage({super.key});

  @override
  State<Setingpage> createState() => _SetingpageState();
}

bool _switchValue = false;
class _SetingpageState extends State<Setingpage> {
  @override
  Widget build(BuildContext context) {
    final themchanger = Provider.of<themchange>(context);
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
            trailing: CupertinoSwitch(
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;

                   if(value==true){
                    
                   }
                });
                print(_switchValue);
              },
            ),
          ),

          ListTile(
            title: Text("Lanuage"),
            leading: Icon(Icons.translate),

            trailing:DropdownButton(items:languageShortNames.entries.map((MapEntry <String,String> entry){
                  return DropdownMenuItem(value:entry.value,child:Text(entry.key));
                  }).toList(), onChanged: (value) {
                      
                      try{

                       setState(() {
                      allleng.put(1,value.toString());

                      
                      
                    });

                      }catch(e){
                         print(e);
                  
                      }

                    
                  },) ,
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