import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/2_domain/2_entities/number_trivia.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/3_data/2_models/number_trivia_model.dart';

import '../../../../fixture/fixture_reader.dart';

void main(){
  group("test for NumberTrivia Model",(){

  final tNumberTriviaModel=NumberTriviaModel(number: 42, text: 'Test test');

  test("should return NumberTriviaModel object",()async{
    expect(tNumberTriviaModel,isA<NumberTrivia>());
  });

  test("should return a Map of json when a integer is given",(){
    //arrange
    Map<String,dynamic> jsonMap=json.decode(fixture("trivia.json"));
    //act
    final numbertriviamodel=NumberTriviaModel.fromJson(jsonMap);
    //assert
    expect(numbertriviamodel,tNumberTriviaModel);



  });



  test("should return a Map of json when a double is given",(){
    //arrange
    Map<String,dynamic> jsonMap=json.decode(fixture("trivia_double.json"));
    //act
    final numbertriviamodel=NumberTriviaModel.fromJson(jsonMap);
    //assert
    expect(numbertriviamodel,tNumberTriviaModel);



  });
  test("should return a NumberTriviaModel object when toJson is called",(){
    //act
 final result =tNumberTriviaModel.toJson();
 final expectedresult='{"text":"Test test","number":42}';
 //assert
    expect(json.encode(result),expectedresult);
  });


  });

 }