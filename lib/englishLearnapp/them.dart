
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class themchange with ChangeNotifier{


  var _themmode = ThemeMode.light;


   get themmode =>_themmode;


   setthem (thmmode){
    _themmode=thmmode;
    notifyListeners();
   }
}