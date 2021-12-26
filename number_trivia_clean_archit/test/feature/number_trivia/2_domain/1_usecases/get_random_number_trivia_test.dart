import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:number_trivia_clean_archit/core/usecase/usecase.dart';

import 'package:number_trivia_clean_archit/feature/number_trivia/2_domain/1_usecases/get_random_number_trivia.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/2_domain/2_entities/number_trivia.dart';

import 'get_concrete_number_trivia_test.mocks.dart';
import 'package:mockito/mockito.dart';
// testing the Usecase for GetConcreteTrivia
void main() {
  late GetRandomNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
  });

  final tNumberTrivia = NumberTrivia(text: 'test', number: 1);
  test("should get a trivia from repository", () async {
    //arrange
    when(mockNumberTriviaRepository.getRandomNumberTrivia())
        .thenAnswer((_) async => Right(tNumberTrivia));
    //act
    final result = await usecase(NoParams());
    //print(result);
    //assert
    expect(result, Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getRandomNumberTrivia());
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
