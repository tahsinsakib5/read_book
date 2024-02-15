// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:testprovider/englishLearnapp/allvocavolary.dart';
import 'package:testprovider/englishLearnapp/data.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:testprovider/englishLearnapp/pactis.dart';

import 'package:testprovider/englishLearnapp/vocavolary.dart';
import 'package:translator/translator.dart';
import 'package:hive/hive.dart';

class ReadPage extends StatefulWidget {
  final storys story;
  ReadPage({super.key, required this.story});

  @override
  State<ReadPage> createState() => _ReadPageState();
}

final stt.SpeechToText _speech = stt.SpeechToText();
final FlutterTts flutterTts = FlutterTts();
final GoogleTranslator translator = GoogleTranslator();

final mybox = Hive.box("my_box");

void putdata() {}
var allword = Hive.box("my_folder");
void getdata() {
  var data = mybox.get(1);

  print(data);
}

class _ReadPageState extends State<ReadPage> {
  int value = 17;
  String? outeope;

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  value++;
                });
              },
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  if (value > 17) {
                    value--;
                  }
                });
              },
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Vocavolary(),
                    ));
              },
              child: const Icon(Icons.remove),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8.0,
              children: widget.story.story.split(' ').map((word) {
                return GestureDetector(
                  onTap: () async {
                    await trans(word);

                    _showVocabularyAlert(context, word);
                  },
                  child: Text(
                    word,
                    style: TextStyle(fontSize: value.toDouble()),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  void _showVocabularyAlert(BuildContext context, String vocabulary) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    vocabulary,
                    style: const TextStyle(fontSize: 30),
                  ),
                  IconButton(
                      onPressed: () {
                        _speak(vocabulary);
                      },
                      icon: const Icon(Icons.volume_up))
                ],
              ),
              Text(outeope ?? ""),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                getdata();
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            ),
            TextButton(
              onPressed: () async {
                // Check if Book Name Exist or not
                // If not Exit then Add Book Name in Hive
                // Add Word in That Book Name in Hive

                var wordData = {
                  "word": vocabulary,
                  "mean": outeope,
                  "time": DateTime.now()
                };

                var box = await Hive.openBox('book_list');

                var bookNameExist = box.values.any(
                    (bookMap) => bookMap['bookName'] == widget.story.storyName);

                if (!bookNameExist) {
                  await box.add(
                    {
                      'bookName': widget.story.storyName,
                      'wordList': [wordData],
                    },
                  );
                } else {
                  // Find the map with bookName 'Book 2' and update wordList

                  var dataList = box.values.toList();

                  for (var map in dataList) {
                    if (map['bookName'] == widget.story.storyName) {
                      // Add the new item to the wordList
                      map['wordList'].add(wordData);
                      break; // Break out of the loop after updating
                    }
                  }

                  // Clear existing data in the box
                  await box.clear();

                  // Add updated data back to the box
                  for (var map in dataList) {
                    await box.add(map);
                  }
                }

                await box.close();

                // var dataExists = allword.values
                //     .any((element) => element == widget.story.storyName);

                // if (!dataExists) {
                //   allword.add(widget.story.storyName);
                //   print(allword.get(1));
                //   print("data save");
                // } else {
                //   print("dont save");
                //   print(allword.get(1));
                // }

                // var data = mybox.add({
                //   "word": vocabulary,
                //   "mean": outeope,
                //   "time": DateTime.now()
                // });

                // print(vocabulary);
                // print(outeope);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  Future<void> trans(String text) async {
    await translator.translate(text, to: "bn").then((value) {
      setState(() {
        outeope = value.text;
      });
    });
  }

  Future<void> _speak(String text) async {
    await flutterTts.setLanguage("en-UK");
    await flutterTts.setPitch(0.9);
    await flutterTts.setSpeechRate(0.5);

    await flutterTts.speak(text);
  }
}
