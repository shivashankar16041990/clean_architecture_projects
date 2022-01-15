import 'package:flutter/material.dart';

class CustomText extends StatelessWidget
{
  String text;
  FontWeight fontWeight;
  double size;
  CustomText({required this.text,required this.fontWeight,required this.size});
  @override
  Widget build(BuildContext context) {
    return
      RichText(
        text: TextSpan(
                text: text,
                style:TextStyle(fontWeight: fontWeight, fontSize: size,color: Colors.black,fontFamily: "Roboto")),

        )
      ;
  }

}