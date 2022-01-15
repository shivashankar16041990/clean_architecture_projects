part of 'signin_bloc.dart';

abstract class SigninState extends Equatable {
  const SigninState();
}

class Error extends SigninState {

  Error();
  @override
  List<Object> get props => [];
}

class Loading extends SigninState {
  @override
  List<Object> get props => [];
}

class SigninCompleted extends SigninState {
  @override
  List<Object> get props => [];
}
class CodeSent extends SigninState{
  @override
  List<Object> get props => [];
}
class Verifed extends SigninState{
  @override
  List<Object> get props => [];
}

class InitialState extends SigninState{
  @override
  List<Object> get props => [];
}
