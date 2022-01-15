import 'package:auth_using_mobile_no/feature/auth/1_presentation/1_widgets/codeautofill.dart';
import 'package:auth_using_mobile_no/feature/auth/1_presentation/3_bloc/LanguageHandlingCubit/smscode.dart';
import 'package:auth_using_mobile_no/feature/auth/1_presentation/3_bloc/automatic_sms_bloc.dart';
import 'package:flutter/material.dart';
import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CaptureCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    BlocProvider.of<AutomaticSmsBloc>(context).add(waitforsms());
      BlocListener<AutomaticSmsBloc,AutomaticSmsState>(listener: (context,state){

        if (state is received_sms) {
          print("inside bloc listener");
          print("state.code is ${state.code}");
          controller.text=state.code;
        }
      });
    Smscode().smscode.future.then((value) {controller.text=value;});

    return

        Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                PinCodeTextField(
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
                  print("pin code is $v");
                },
                onChanged: (value) {
                  print(value);

                },
                appContext: context,
              ),


              ElevatedButton(onPressed: (){
                Smscode().smscode.complete(controller.text);


        }, child: Text("Submit"))
            ]
        )
    ),
        ));
  }

  Future<String> messagelistener() async {
    String commingSms;

    commingSms = (await AltSmsAutofill().listenForSms) as String;
    var number =  RegExp(r'\d+');
    return number.stringMatch(commingSms)??"11111";
  }
}
