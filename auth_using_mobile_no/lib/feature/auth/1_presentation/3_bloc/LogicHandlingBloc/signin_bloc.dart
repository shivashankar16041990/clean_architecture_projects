import 'dart:async';

import 'package:auth_using_mobile_no/core/util/Stringtointeger.dart';
import 'package:auth_using_mobile_no/feature/auth/2_domain/1_usecases/GetSignIn.dart';
import 'package:auth_using_mobile_no/feature/auth/2_domain/1_usecases/GetSignOut.dart';
import 'package:auth_using_mobile_no/feature/auth/2_domain/1_usecases/register.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'signin_event.dart';

part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  GetSignIn getSignIn;
  GetSignOut getSignOut;
  GetRegisterwithPhone getRegisterwithPhone;
  InputConverter inputConverter;

  SigninBloc(
      {required this.getRegisterwithPhone,
      required this.inputConverter,
      required this.getSignOut,
      required this.getSignIn})
      : super(InitialState()) {
    on<verify>(_verifyMaptoStates);
    on<verifyandcontinue>(_verifyandcontinueMaptoStates);
  }

  FutureOr<void> _verifyMaptoStates(
      verify event, Emitter<SigninState> emit) async {
    print("_verifyMaptoStates is called");
  /*  final inputEither = await inputConverter
        .stringtoUnsignedIntegerand10digits(event.mobile_number);
    await inputEither.fold((failure) {print("invalid mobile no");
      emit(Error());
    }, (integer) async {*/
      print("emmiting Loading");
      emit(Loading());
      print("calling the function");
      final successorfailure = await getRegisterwithPhone(Paramss(event.mobile_number));
      successorfailure.fold((failure) {
        print("emmitning error");
        emit(Error());
      }, (success) {
        print("emitting code sent");
        emit(CodeSent());
      });

  }

  FutureOr<void> _verifyandcontinueMaptoStates(
      verifyandcontinue event, Emitter<SigninState> emit) async {
    final successorfailure = await getSignIn(Params(int.parse(event.code)));
    successorfailure.fold((failure) {
      emit(Error());
    },
            (success) {
      emit((SigninCompleted()));
    });
  }
}
