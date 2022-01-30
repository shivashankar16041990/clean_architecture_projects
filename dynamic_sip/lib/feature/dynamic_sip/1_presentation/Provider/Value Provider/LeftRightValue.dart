import 'package:flutter/material.dart';

class LeftRightValue with ChangeNotifier{
String _left;
String _right;
Color _bgColor;
String get left=>_left;
String get right=>_right;
Color get bgColor=> _bgColor;


String get prevright=>_prevright;
String _prevright;

LeftRightValue({required String rightValue, required String leftValue,required Color backgroundColor,required String prevright}):
  _left=leftValue,
  _right=rightValue,
      _bgColor=backgroundColor,
_prevright=prevright
;


void update({required String rightValue}){


  _prevright=_right;
  _right=rightValue;

  _left=(100-int.parse(rightValue)).toString();

  if(int.parse(_left)<50){
    _bgColor=Colors.orange;}
    else{
      _bgColor=Colors.green;
  }

  notifyListeners();
}

}