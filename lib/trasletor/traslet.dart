import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';

class TranslationPractice extends StatefulWidget {
  TranslationPractice({Key? key}) : super(key: key);

  @override
  _TranslationPracticeState createState() => _TranslationPracticeState();
}

class _TranslationPracticeState extends State<TranslationPractice> {
  final TextEditingController lag = TextEditingController();
  final GoogleTranslator translator = GoogleTranslator();
  final FlutterTts flutterTts = FlutterTts();
  String? outeope;
  final stt.SpeechToText _speech = stt.SpeechToText();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Translation Practice'),
        ),
        body: Column(
          children: [
            TextField(
              controller: lag,
              decoration: InputDecoration(
                labelText: 'Enter text to translate',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                _startListening();
              },
              child: Text("Start Voice Input"),
            ),
            ElevatedButton(
              onPressed: () async {
                await trans();
                await _speak(lag.text);
              },
              child: Text("Translate"),
            ),
            SizedBox(height: 20),
            Text(
              'Translated Text:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(outeope ?? ""),
          ],
        ),
      ),
    );
  }

  void _startListening() {
    _speech.listen(
      onResult: (result) {
        if (result.finalResult) {
          setState(() {
            lag.text = result.recognizedWords;
          });
        }
      },
    );
  }

  Future<void> trans() async {
    await translator.translate(lag.text, to: "ur").then((value) {
      setState(() {
        outeope = value.text;
      });
    });
  }

  Future<void> _speak(String text) async {
    await flutterTts.setLanguage("en-IN");
    await flutterTts.setPitch(0.9);
    await flutterTts.setSpeechRate(0.5);
    
    await flutterTts.speak(text);
  }

  
  
}




