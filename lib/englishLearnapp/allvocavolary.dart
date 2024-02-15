import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:testprovider/data/words_by_book.dart';
import 'package:testprovider/englishLearnapp/vocavolary.dart';
import 'package:testprovider/screens/word_list_by_book_screen.dart';

class allvocavolary extends StatefulWidget {
  const allvocavolary({super.key});

  @override
  State<allvocavolary> createState() => _allvocavolaryState();
}

var allBooks = Hive.box("book_list");

class _allvocavolaryState extends State<allvocavolary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: allBooks.values.length,
              itemBuilder: (context, index) {
                var book = allBooks.get(index);

                return Card(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text('${book?['bookName']}'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WordListByBookScree(
                                    wordList: book?['wordList'] as List),
                              ));
                        },
                      )),
                );
              },
            ),
          ),

          //   ElevatedButton(onPressed: () {
          //   var word=  allword.put(2, "Molla nasir uddin");

          //  setState(() {

          //  });
          //   }, child: Text("salib")),

          //   ElevatedButton(onPressed: () {

          //   print(allword.get(1));
          //   }, child: Text("salib"))
        ],
      ),
    );
  }

  void setfolder() {}
}
