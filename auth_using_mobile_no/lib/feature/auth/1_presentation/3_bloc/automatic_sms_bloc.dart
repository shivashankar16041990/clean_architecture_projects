import 'dart:async';

import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:auth_using_mobile_no/feature/auth/1_presentation/3_bloc/LanguageHandlingCubit/smscode.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'automatic_sms_event.dart';
part 'automatic_sms_state.dart';

class AutomaticSmsBloc extends Bloc<AutomaticSmsEvent, AutomaticSmsState> {
  AutomaticSmsBloc() : super(AutomaticSmsInitial()) {
    on<AutomaticSmsEvent>((event, emit) async{
      if (event is waitforsms){
        String commingSms;
print("waiting for a message");
        commingSms = (await AltSmsAutofill().listenForSms) as String;
        print("waiting finished with msg $commingSms");
      var number =  RegExp(r'\d+');
      print("coming sms is $commingSms");
      emit(received_sms(code:number.stringMatch(commingSms)??"11111"));
      Smscode().smscode.complete(commingSms);

      }
    });
  }
}
