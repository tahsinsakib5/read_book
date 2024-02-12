

import 'package:flutter/material.dart';

class Countprovider with ChangeNotifier{
  

 int count = 10;

//  int get _count => count; 


 set(){
  count++;
  notifyListeners();
 }
}