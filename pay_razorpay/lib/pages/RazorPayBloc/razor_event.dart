part of 'razor_bloc.dart';

abstract class RazorEvent extends Equatable {
  const RazorEvent();
}
class Pay extends RazorEvent{
  int amount;
  Pay({required this.amount});

  @override

  List<Object?> get props => [amount];
}