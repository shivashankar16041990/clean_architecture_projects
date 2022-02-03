part of 'razor_bloc.dart';

abstract class RazorState extends Equatable {
  const RazorState();
}

class Loading extends RazorState {
  @override
  List<Object> get props => [];
}
class Success extends RazorState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class Failure extends RazorState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class ExtenalWallet extends RazorState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}