part of 'automatic_sms_bloc.dart';

abstract class AutomaticSmsState extends Equatable {
  const AutomaticSmsState();
}

class AutomaticSmsInitial extends AutomaticSmsState {
  @override
  List<Object> get props => [];
}


class received_sms extends AutomaticSmsState{


  String code;
  received_sms({required this.code});


  @override

  List<Object?> get props => [];

}