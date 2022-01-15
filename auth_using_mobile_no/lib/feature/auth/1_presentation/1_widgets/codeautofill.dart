import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CodeAutofill extends StatelessWidget{
  TextEditingController controller;
  CodeAutofill({required this.controller});
  @override
  Widget build(BuildContext context) {
   return PinCodeTextField(
     length: 6,
     obscureText: false,
     animationType: AnimationType.fade,
     pinTheme: PinTheme(
       shape: PinCodeFieldShape.box,
       borderRadius: BorderRadius.circular(5),
       fieldHeight: 50,
       fieldWidth: 40,
       activeFillColor: Colors.white,
     ),
     animationDuration: Duration(milliseconds: 300),
     backgroundColor: Colors.blue.shade50,
     enableActiveFill: true,

     controller: controller,
     onCompleted: (v) {
       print("Completed");
     },
     onChanged: (value) {
       print(value);

     },
     appContext: context,
   );
  }
}
