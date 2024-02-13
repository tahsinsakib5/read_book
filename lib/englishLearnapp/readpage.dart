import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart'as stt;
import 'package:testprovider/englishLearnapp/allvocavolary.dart';
import 'package:testprovider/englishLearnapp/data.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:testprovider/englishLearnapp/homepage.dart';
import 'package:testprovider/englishLearnapp/vocavolary.dart';
import 'package:translator/translator.dart';
import 'package:hive/hive.dart';

class ReadPage extends StatefulWidget {
 final String story;
  ReadPage({super.key, required this.story});

  @override
  State<ReadPage> createState() => _ReadPageState();
}

   final stt.SpeechToText _speech = stt.SpeechToText();
   final FlutterTts flutterTts = FlutterTts();
   final GoogleTranslator translator = GoogleTranslator();

  final mybox = Hive.box("my_box");

   void putdata (){
   

   

     
   }

    void getdata (){
   var data=  mybox.get(1);

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

             FloatingActionButton(
              onPressed: () {
               Navigator.push(context,MaterialPageRoute(builder: (context) => Vocavolary(),));
              },
              child: Icon(Icons.remove),
            ),
             FloatingActionButton(
              onPressed: () {
               Navigator.push(context,MaterialPageRoute(builder: (context) => allvocavolary(),));
              },
              child: Icon(Icons.remove),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      spacing: 8.0,
                       
                      children: widget.story.split(' ').map((word) {
                        return GestureDetector(
                          onTap: (){
                            trans(word);
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
              onPressed: ()async{
                getdata();
                Navigator.of(context).pop();
               
              },
              child: Text("Close"),
            ),
             
             TextButton(
                onPressed: () {
             
                  var data=  mybox.put(3, {
                 "word":vocabulary,
                  "mean":outeope
                 });
             
                   
                  // print(vocabulary);
                  // print(outeope);
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
