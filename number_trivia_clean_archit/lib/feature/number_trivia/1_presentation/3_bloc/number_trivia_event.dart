part of 'number_trivia_bloc.dart';

abstract class NumberTriviaEvent extends Equatable {
   const NumberTriviaEvent();
}
class GetTriviaforConcreteNumber extends NumberTriviaEvent{
  final  String numberString;

  GetTriviaforConcreteNumber({required this.numberString});

  @override
  // TODO: implement props
  List<Object?> get props => [numberString];


}

class GetTriviaforRandomNumber extends NumberTriviaEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}