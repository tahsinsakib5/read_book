import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
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
      body: ListView.builder(shrinkWrap:true,itemCount:mybox.keys.toList().length,itemBuilder: (context, index) {
           var formattedTime = DateFormat('dd/MMM/yyyy  hh:mm a',).format(mybox.getAt(index)["time"]);
                return Card(
                  child: ListTile(
                    title: Text(mybox.getAt(index)["word"]),
                    subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(mybox.getAt(index)["mean"],style: TextStyle(fontSize: 17),),
                  Text(formattedTime,style: TextStyle(fontSize: 12),),
                ],
              ),
                    

                    trailing:IconButton(onPressed: () {
                      mybox.deleteAt(index);
                      setState(() {
                        
                      });
                    }, icon:Icon(Icons.delete)),
                  ),
                );
              },),
    );
  }
}