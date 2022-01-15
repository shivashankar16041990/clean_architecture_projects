part of 'signin_bloc.dart';

abstract class SigninEvent extends Equatable {
  const SigninEvent();
}
class verify extends SigninEvent{
  String mobile_number;
  verify({required this.mobile_number});
  @override
  // TODO: implement props
  List<Object?> get props => [mobile_number];

}
class verifyandcontinue extends SigninEvent{
  String code;
  verifyandcontinue({required this.code});
  @override
  // TODO: implement props
  List<Object?> get props => [code];

}


