import 'package:flutter/material.dart';

class WordListByBookScree extends StatefulWidget {
  const WordListByBookScree({super.key, required this.wordList});

  final List wordList;

  @override
  State<WordListByBookScree> createState() => _WordListByBookScreeState();
}

class _WordListByBookScreeState extends State<WordListByBookScree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Word List')),
      body: ListView.builder(
          itemCount: widget.wordList.length,
          itemBuilder: (context, index) => ListTile(
                title: Text('${widget.wordList[index]['word']}'),
                subtitle: Text('${widget.wordList[index]['mean']}'),
                trailing: Text('${widget.wordList[index]['time']}'),
              )),
    );
  }
}
