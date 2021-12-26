import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_concrete_number_trivia_test.mocks.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/2_domain/1_usecases/get_concrete_number_trivia.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/2_domain/2_entities/number_trivia.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/2_domain/3_repositories_abstract/number_trivia_repositories.dart';
// testing the Usecase for GetRamdomTrivia
@GenerateMocks([NumberTriviaRepository])
void main()
{
  late GetConcreteNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;


  setUp((){
    mockNumberTriviaRepository=MockNumberTriviaRepository();//repository  initialization
    usecase =GetConcreteNumberTrivia(mockNumberTriviaRepository);//usecase initialization

  });

  final tNumber=1;  // testing number
  final tNumberTrivia=NumberTrivia(text:'test' , number: 1); //expected result
  test("should get a trivia for the number from the repository",()async{
    //arrange
    when(mockNumberTriviaRepository.getConcreteNumberTrivia(any)).thenAnswer((_)async => Right(tNumberTrivia));
    //act
    final result=await usecase(Params(number:tNumber));
    //print(result);
    //assert
    expect(result,Right(tNumberTrivia));
     verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
     verifyNoMoreInteractions(mockNumberTriviaRepository);





  });

}
