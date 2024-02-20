import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:testprovider/englishLearnapp/bottomnavigation.dart';
import 'package:testprovider/englishLearnapp/homepage.dart';
import 'package:testprovider/englishLearnapp/pactis.dart';
import 'package:testprovider/englishLearnapp/readpage.dart';
import 'package:testprovider/englishLearnapp/them.dart';




import 'package:testprovider/provider/cont.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:testprovider/search/search.dart';









void main()async{
 await Hive.initFlutter();
 await Hive.openBox("my_box");
  await Hive.openBox("my_folder");
  await Hive.openBox('book_list');
  await Hive.openBox("lange");
   
  runApp(MyApp());
}
 class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context) => Countprovider()),
        ChangeNotifierProvider(create:(context) => themchange(),)
      ],
      
      
      child:
         MaterialApp(
        debugShowCheckedModeBanner: false,
   
       darkTheme:ThemeData(
        brightness: Brightness.dark
       ),
        home:Scaffold(
          body: Center(
            child:Bontonnavigationread(),
          ),
        ),
      ));
    
    
   
  }
}





