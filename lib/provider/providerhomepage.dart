import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprovider/provider/cont.dart';




class providerhomepage extends StatelessWidget {
   providerhomepage({super.key});
  @override
  Widget build(BuildContext context) {
    
 
 print("sakib");
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
          
          // Consumer(builder:<Countprovider>(context, value, child) {
          //   return  Text(value.count.toString());
          // },),

          CountText(),

         ElevatedButton(onPressed: () {
          final countproviders = Provider.of<Countprovider>(context);
              countproviders.set();
            }, child:Text("save"))
          ],
        ),
      ),

    );
  }
}

class CountText extends StatelessWidget {
  const CountText({
    super.key,
    
  });

 

  @override
  Widget build(BuildContext context) {
    final countproviders = Provider.of<Countprovider>(context);
    return Text(countproviders.count.toString());
  }
}