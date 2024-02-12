import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart'as stt;
import 'package:testprovider/englishLearnapp/data.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translator/translator.dart';

class ReadPage extends StatefulWidget {
  ReadPage({super.key});

  @override
  State<ReadPage> createState() => _ReadPageState();
}

   final stt.SpeechToText _speech = stt.SpeechToText();
   final FlutterTts flutterTts = FlutterTts();
   final GoogleTranslator translator = GoogleTranslator();

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
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  if (value > 17) {
                    value--;
                  }
                });
              },
              child: Icon(Icons.remove),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: moralStory.length,
                itemBuilder: (context, index) {
                  List<String> words = moralStory[index].split(' ');
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      spacing: 8.0,
                      children: words.map((word) {
                        return GestureDetector(
                          onTap: ()async{
                            _showVocabularyAlert(context, word);
                         await trans(word);
                          },
                          child: Text(
                            word,
                            style: TextStyle(fontSize: value.toDouble()),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ],
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
              SizedBox(
                height:30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(vocabulary, style:TextStyle(fontSize:30),),

                  IconButton(onPressed:() {
                    _speak(vocabulary);
                  }, icon:Icon(Icons.volume_up))
                ],
              ),
              Text(outeope ??""),
            ],
          ),
          
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
               
              },
              child: Text("Close"),
            ),

            TextButton(
              onPressed: () {
                print(vocabulary);
                print(outeope);
              },
              child: Text("save"),
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
