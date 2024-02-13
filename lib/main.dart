import 'package:flutter/material.dart';
import 'package:testprovider/englishLearnapp/homepage.dart';
import 'package:testprovider/englishLearnapp/readpage.dart';

import 'package:testprovider/provider/cont.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';









void main()async{
 await Hive.initFlutter();

  var box = await Hive.openBox("my_box");
 var boxtow=  await Hive.openBox("my_folder");
  runApp(const MyApp());
}
 class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create:(context) => Countprovider(),child: MaterialApp(
      home:HomePageReadBook(),
    ),);
    
   
  }
}



