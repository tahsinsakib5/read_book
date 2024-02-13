import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Vocavolary extends StatefulWidget {
   Vocavolary({super.key});

  @override
  State<Vocavolary> createState() => _VocavolaryState();
}

class _VocavolaryState extends State<Vocavolary> {
 final mybox = Hive.box("my_box");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         ListView.builder(shrinkWrap:true,itemCount:mybox.keys.toList().length,itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(mybox.getAt(index)["word"]),
                    subtitle: Text(mybox.getAt(index)["mean"]),

                    trailing:IconButton(onPressed: () {
                      mybox.deleteAt(index);
                      setState(() {
                        
                      });
                    }, icon:Icon(Icons.delete)),
                  ),
                );
              },),
        ],
      ),
    );
  }
}