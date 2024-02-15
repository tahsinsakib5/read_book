import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class pactis extends StatelessWidget {
  const pactis({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    
       InkWell(
            onTap:() =>
              showPopover(context: context, bodyBuilder: (context) => Container(
                child: Text("sakib"),
              ),backgroundColor:Colors.amber ),
            
            child:Icon(Icons.abc),
          
      
    );
  }
}

class secondtest extends StatelessWidget {
  const secondtest({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Text("sakib"),
           Text("sakib"),
          Text("sakib"),
        

        ],
      
    );
  }
}