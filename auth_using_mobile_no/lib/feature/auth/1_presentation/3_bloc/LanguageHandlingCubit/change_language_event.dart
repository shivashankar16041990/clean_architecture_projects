part of 'change_language_bloc.dart';

abstract class ChangeLanguageEvent extends Equatable {
  const ChangeLanguageEvent();
}
class ChangeLanguage extends ChangeLanguageEvent{
  int index;
  ChangeLanguage({required this.index});

  @override
  // TODO: implement props
  List<Object?> get props => [index];
}
