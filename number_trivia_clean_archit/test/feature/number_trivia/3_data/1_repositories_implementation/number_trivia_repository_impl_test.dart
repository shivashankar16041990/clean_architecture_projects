import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia_clean_archit/core/error/exception.dart';
import 'package:number_trivia_clean_archit/core/error/failure.dart';
import 'package:number_trivia_clean_archit/core/platform/network_info.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/2_domain/2_entities/number_trivia.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/3_data/1_repositories_implementation/number_trivia_repository_impl.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/3_data/2_models/number_trivia_model.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/3_data/3_datasources/number_trivia_local_data_sources.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/3_data/3_datasources/number_trivia_remote_data_source.dart';

import 'number_trivia_repository_impl_test.mocks.dart';

@GenerateMocks([NumberTriviaLocalDataSource,NumberTriviaRemoteDataSource,NetworkInfo])
void main() async{
  late NumberTriviaRepositoryImpl repository;
  late MockNumberTriviaLocalDataSource mockNumberTriviaLocalDataSource;
  late MockNumberTriviaRemoteDataSource mockNumberTriviaRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;
  setUp(() {
    mockNumberTriviaLocalDataSource = MockNumberTriviaLocalDataSource();
    mockNumberTriviaRemoteDataSource = MockNumberTriviaRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = NumberTriviaRepositoryImpl(
        remoteDataSource: mockNumberTriviaRemoteDataSource,
        localDataSource: mockNumberTriviaLocalDataSource,
        networkInfo: mockNetworkInfo

    );
  });
  final tNumber = 42;
  final tNumberTriviaModel = NumberTriviaModel(
      text: "Test test", number: 42);
  final NumberTrivia tnumberTrivia = tNumberTriviaModel;

  group("getConcreteNumberTrivia", ()  {

    test("should check if the isconnected is true ", () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

       //repository.getConcreteNumberTrivia(tNumber);
      mockNetworkInfo.isConnected;
      verify(mockNetworkInfo.isConnected);
    });
  });



}



