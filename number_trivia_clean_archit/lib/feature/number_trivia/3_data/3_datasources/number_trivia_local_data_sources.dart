import 'dart:convert';

import 'package:number_trivia_clean_archit/core/error/exception.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/3_data/2_models/number_trivia_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
const Cache_Number_trivia="Cache_Number_trivia";
abstract class NumberTriviaLocalDataSource{
  Future<NumberTriviaModel> getLastNumberTrivia();
  Future<void> cacheNumberTrivia(NumberTriviaModel cachetoLocal);
}
class NumberTriviaLocalDataSourceImpl implements NumberTriviaLocalDataSource{
  SharedPreferences sharedPreferences;
  NumberTriviaLocalDataSourceImpl({required this.sharedPreferences});





  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel cachetoLocal) {
  return sharedPreferences.setString(Cache_Number_trivia, json.encode(cachetoLocal.toJson()));
  }

  @override
  Future<NumberTriviaModel> getLastNumberTrivia() {
  final jsonString=sharedPreferences.getString(Cache_Number_trivia);
  if(jsonString!=null){
    return Future.value(NumberTriviaModel.fromJson(json.decode(jsonString)));
  }
  else throw CacheException();
  }

}
