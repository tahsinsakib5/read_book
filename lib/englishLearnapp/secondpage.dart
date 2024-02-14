import 'package:flutter/material.dart';
import 'package:testprovider/englishLearnapp/readpage.dart';

class Secondpagepageread extends StatefulWidget {
  final List allstory;
  const Secondpagepageread({super.key, required this.allstory});

  @override
  State<Secondpagepageread> createState() => _SecondpagepagereadState();
}

class _SecondpagepagereadState extends State<Secondpagepageread> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemCount:widget.allstory.length,itemBuilder: (context, index) {
        return ListTile(
          title: Text(widget.allstory[index].storyName),
          onTap:() {
            Navigator.push(context,MaterialPageRoute(builder: (context) => ReadPage(story:widget.allstory[index]),));
          },
        );
      },),
    );
  }
}