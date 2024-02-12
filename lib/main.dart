import 'package:flutter/material.dart';
import 'package:testprovider/englishLearnapp/readpage.dart';
import 'package:testprovider/provider/cont.dart';
import 'package:provider/provider.dart';








void main() {
  runApp(const MyApp());
}
 class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create:(context) => Countprovider(),child: MaterialApp(
      home:ReadPage(key:null),
    ),);
    
   
  }
}



