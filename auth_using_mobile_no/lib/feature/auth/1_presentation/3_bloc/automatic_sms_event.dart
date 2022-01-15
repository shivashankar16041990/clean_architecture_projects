part of 'automatic_sms_bloc.dart';

abstract class AutomaticSmsEvent extends Equatable {
  const AutomaticSmsEvent();
}
class waitforsms extends AutomaticSmsEvent
{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
