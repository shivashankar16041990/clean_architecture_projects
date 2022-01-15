import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'change_language_event.dart';
part 'change_language_state.dart';

class ChangeLanguageBloc extends Bloc<ChangeLanguageEvent, int> {
  ChangeLanguageBloc() : super(39) {
    on<ChangeLanguage>((event, emit) {
      emit(event.index);
    });
  }
}
