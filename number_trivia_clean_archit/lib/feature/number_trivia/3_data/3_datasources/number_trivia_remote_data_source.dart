import 'dart:convert';

import 'package:number_trivia_clean_archit/core/error/exception.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/3_data/2_models/number_trivia_model.dart';
import 'package:http/http.dart' as http;

abstract class NumberTriviaRemoteDataSource {
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);

  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource {
  final http.Client client;

  NumberTriviaRemoteDataSourceImpl({required this.client});

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) async {
    return getTriviaFromUrl(url: 'http://numbersapi.com/$number');
  }

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() async {
    return getTriviaFromUrl(url: 'http://numbersapi.com/random');
  }

  Future<NumberTriviaModel> getTriviaFromUrl({required String url}) async {
    final response = await client
        .get(Uri.parse(url), headers: {'Content-type': 'application/json'});
    if (response.statusCode == 200) {
      print("${response.body}");
      return NumberTriviaModel.fromJson(json.decode(response.body));
    } else
      throw ServerException();
  }
}
