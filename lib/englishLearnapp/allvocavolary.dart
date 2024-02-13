import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:testprovider/englishLearnapp/vocavolary.dart';

class allvocavolary extends StatefulWidget {
  const allvocavolary({super.key});

  @override
  State<allvocavolary> createState() => _allvocavolaryState();
}

var allword = Hive.box("my_folder");

class _allvocavolaryState extends State<allvocavolary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemCount:allword.keys.toList().length,itemBuilder: (context, index) {
              return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(allword.getAt(index)),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Vocavolary(),));
                  },
                )
              ),
              );
            },),
          ),

        //   ElevatedButton(onPressed: () {
        //   var word=  allword.put(1, "Molla nasir uddin");
         
        //  setState(() {
           
        //  });
        //   }, child: Text("salib")),


        //   ElevatedButton(onPressed: () {
       
         
        //   print(allword.get(1));
        //   }, child: Text("salib"))
        ],
      ),
    );
  }

  void setfolder (){
    
  }
}