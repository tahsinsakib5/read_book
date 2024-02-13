import 'package:flutter/material.dart';
import 'package:testprovider/englishLearnapp/data.dart';
import 'package:testprovider/englishLearnapp/readpage.dart';

class HomePageReadBook extends StatefulWidget {
  const HomePageReadBook({super.key});

  @override
  State<HomePageReadBook> createState() => _HomePageReadBookState();
}

class _HomePageReadBookState extends State<HomePageReadBook> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
         Container(
          height: 170,
           child: ListView.builder(scrollDirection:Axis.horizontal,shrinkWrap: true,itemCount:6,itemBuilder: (context, index) {
             return   InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ReadPage(story: allstory[index]),));
              },
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                   
                            
                   child: Image.asset("assets/molla.jpg",fit: BoxFit.cover,),
                  ),
               ),
             );
           },),
         ),
      
          Expanded(child: Container())
          ],
        ),
      ),
    );
  }
}