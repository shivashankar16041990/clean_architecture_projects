import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:number_trivia_clean_archit/core/error/failure.dart';
import 'package:number_trivia_clean_archit/core/util/input_convertor.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/2_domain/1_usecases/get_concrete_number_trivia.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/2_domain/1_usecases/get_random_number_trivia.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/2_domain/2_entities/number_trivia.dart';

part 'number_trivia_event.dart';

part 'number_trivia_state.dart';

const String Server_Failure_message = "Server Failure";
const String Cache_Failure_message = "Cache Failure";
const String Invalid_Input_Failure_Message =
    "Invalid Input number must be positive integer or zero";

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  late GetConcreteNumberTrivia getConcreteNumberTrivia;
  late GetRandomNumberTrivia getRandomNumberTrivia;
  late InputConverter inputConverter;

  NumberTriviaBloc(
      {required GetConcreteNumberTrivia concrete,
      required GetRandomNumberTrivia random,
      required this.inputConverter})
      : super(Empty()) {
    assert(concrete != null);
    assert(random != null);
    getConcreteNumberTrivia = concrete;
    getRandomNumberTrivia = random;
    on<GetTriviaforRandomNumber>(_GetTriviaforRandomNumber);
    on<GetTriviaforConcreteNumber>(_GetTriviaforConcreteNumber);
  }

  Future<FutureOr<void>> _GetTriviaforConcreteNumber (
      GetTriviaforConcreteNumber event, Emitter<NumberTriviaState> emit) async{
    final inputEither =
     await   inputConverter.stringtoUnsignedInteger(event.numberString);
  await  inputEither.fold(
      (failure) {
        emit(Error(message: Invalid_Input_Failure_Message));
      },
      (integer) async {
        emit(Loading());
        print("calling getConcretNumber trivia");
        final failureOrTrivia =
            await getConcreteNumberTrivia(Params(number: integer));

        final result= await failureOrTrivia.fold(
                (failure) => Error(message: _mapFailuretomessage(failure)),
                (trivia) {print(" got the string${trivia.text}");return  Loaded(numberTrivia: trivia);});

        emit(result);

        print("after await");
       // final result=_eitherLoadedOrErrorState(failureOrTrivia);
        print("after final");

        //Future.delayed(Duration(seconds: 3)).whenComplete(() => emit(result));
        print("after emit");
      },
    );
  }

  NumberTriviaState _eitherLoadedOrErrorState(
      Either<Failure, NumberTrivia> failureorTrivia) {


    return  failureorTrivia.fold(
        (failure) => Error(message: _mapFailuretomessage(failure)),
        (trivia) {print(" got the string${trivia.text}");return  Loaded(numberTrivia: trivia);});
  }

  String _mapFailuretomessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        {
          return Server_Failure_message;
        }
      case CacheFailure:
        {
          return Cache_Failure_message;
        }
      default:
        return "unexpected error";
    }
  }

  Future<FutureOr<void>> _GetTriviaforRandomNumber(
      GetTriviaforRandomNumber event, Emitter<NumberTriviaState> emit) async {
    emit(Loading());
    final failureottrivia = await getRandomNumberTrivia(NoParams());
    emit( _eitherLoadedOrErrorState(failureottrivia));
  }
}
