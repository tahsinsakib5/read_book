// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:speech_to_text/speech_to_text.dart'as stt;
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
var Names = languageShortNames.keys.toList();




  final mybox = Hive.box("my_box");

   void putdata (){
   

   
 
     
   }
        var allword = Hive.box("my_folder");
        var allleng = Hive.box("lange");
    

class _ReadPageState extends State<ReadPage> {
  int value = 17;
  String? outeope;
  String? words;

  String Language ="hi";


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
            
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      spacing: 8.0,
                       
                      children: widget.story.story.split(' ').map((word) {
                        return GestureDetector(
                          onTap: ()async{
                       
                          setState(() {
                            words=word;
                          });
                          allleng.put(1,"hi");

                          await  trans(word,allleng.get(1));
                            
                               
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
              Row(
                children: [
                  Text(outeope ??""),

                  DropdownButton(items:languageShortNames.entries.map((MapEntry <String,String> entry){
                  return DropdownMenuItem(value:entry.value,child:Text(entry.key));
                  }).toList(), onChanged: (value) {
                      
                      try{

                       setState(() {
                      allleng.put(1,value.toString());

                      
                      
                    });

                      }catch(e){

                         trans(words!,allleng.get(1));
                      }

                    
                  },)
                ],
              ),
            ],
          ),
          
          actions: [
            TextButton(
              onPressed: ()async{
              
                Navigator.of(context).pop();
               
              },
              child: Text("Close"),
            ),
             
             TextButton(
                onPressed: () {
           
                  
     var dataExists = allword.values.any((element) =>
      element == widget.story.storyName);

                   
    if (!dataExists) {
      allword.add(widget.story.storyName);
      print(allword.get(1));
      print("data save");
    }else{
      print("dont save");
      print(allword.get(1));
    }
   
  

    
             
                  var data=  mybox.add({
                 "word":vocabulary,
                  "mean":outeope,
                  "time":DateTime.now()
                 });
             
                   
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


    Future<void> trans(String text, String lang) async {
    await translator.translate(text, to:lang).then((value) {
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

