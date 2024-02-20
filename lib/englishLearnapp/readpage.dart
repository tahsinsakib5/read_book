import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'package:testprovider/englishLearnapp/data.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'package:testprovider/englishLearnapp/setingpage.dart';

import 'package:translator/translator.dart';
import 'package:hive/hive.dart';

class ReadPage extends StatefulWidget {
  final Story story;
  ReadPage({super.key, required this.story});

  @override
  State<ReadPage> createState() => _ReadPageState();
}

final stt.SpeechToText _speech = stt.SpeechToText();
final FlutterTts flutterTts = FlutterTts();
final GoogleTranslator translator = GoogleTranslator();

var languageShortNames = {
  'Bangla': 'bn',
  'Hindi': 'hi',
  'English': 'en',
  'Spanish': 'es',
  'French': 'fr',
  'German': 'de',
  'Mandarin': 'zh',
  'Arabic': 'ar',
  'Russian': 'ru',
  'Portuguese': 'pt'
};

var shortNames = languageShortNames.values.toList();
var names = languageShortNames.keys.toList();

final mybox = Hive.box("my_box");

void putdata() {}
var allword = Hive.box("my_folder");
var allleng = Hive.box("lange");

class _ReadPageState extends State<ReadPage> {
  int value = 17;
  String? outeope;
  String? words;

  String Language = "hi";

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add),
              Icon(Icons.remove),
              Icon(Icons.remove),
            ],
          ),
          // FloatingActionButton(
          //   onPressed: () {
          //     setState(() {
          //       if (value > 17) {
          //         value--;
          //       }
          //     });
          //   },
          //   child: Icon(Icons.remove),
          // ),
          // FloatingActionButton(
          //   onPressed: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => Setingpage(),
          //         ));
          //   },
          //   child: Icon(Icons.remove),
          // ),
        ],
      ),
      appBar: AppBar(title: const Text('Reading Page')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 8.0,
            children: widget.story.story.split(' ').map((word) {
              return ReadPageWord(word: word);
            }).toList(),
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
              Row(
                children: [
                  Text(outeope ?? ""),
                  DropdownButton(
                    items: languageShortNames.entries
                        .map((MapEntry<String, String> entry) {
                      return DropdownMenuItem(
                          value: entry.value, child: Text(entry.key));
                    }).toList(),
                    onChanged: (value) {
                      try {
                        setState(() {
                          allleng.put(1, value.toString());
                        });
                      } catch (e) {
                        trans(words!, allleng.get(1));
                      }
                    },
                  )
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
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
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  Future<void> trans(String text, String lang) async {
    await translator.translate(text, to: lang).then((value) {
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

class ReadPageWord extends StatelessWidget {
  const ReadPageWord({
    super.key,
    required this.word,
  });

  final String word;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // setState(() {
        //   words = word;
        // });
        // allleng.put(1, "bn");

        // await trans(word, allleng.get(1));

        showPopover(
          context: context,
          bodyBuilder: (context) => Center(
            child: Container(
              color: Colors.amber,
              width: 50,
              height: 50,
              // child: Text('Bangladesh'),
            ),
          ),
          onPop: () => print('Popover was popped!'),
          // direction: PopoverDirection.bottom,
          width: 200,
          height: 400,
          arrowHeight: 15,
          arrowWidth: 30,
        );

        // _showVocabularyAlert(context, word);
      },
      child: Text(
        word,
        // style: TextStyle(fontSize: value.toDouble()),
      ),
    );
  }
}
