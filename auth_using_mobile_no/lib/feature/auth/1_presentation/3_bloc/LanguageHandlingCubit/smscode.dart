import 'dart:async';

class Smscode{
  Smscode._internal();
  static final   Smscode _singleinstance=Smscode._internal();
  factory Smscode(){
   return _singleinstance;
  }


   Completer smscode=Completer<String>();






}