import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sample/core/error/exception.dart';
import 'package:sample/core/error/failure.dart';
import 'package:sample/feature/api/2_domain/2_entities/entity.dart';
import 'package:http/http.dart' as http;

class GetData {
  final InternetConnectionChecker dataConnectionChecker = InternetConnectionChecker();

  Future <Either<Failure, List<Data>>> call() async {
    if (await dataConnectionChecker.hasConnection) {
      try {
        final response = await http.get(
            Uri.parse("https://gorest.co.in/public/v1/users"


            )
        );

        if (response.statusCode == 200) {
          Map<String, dynamic> responsebody = jsonDecode(response.body);
          List<dynamic>data = responsebody['data'];

          List<Data> objectlist = List.empty(growable: true);

          objectlist = data.map((e) => Data.fromjson(e)).toList();

          objectlist.forEach((element) {
            print("name : ${element.name }      email : ${element.email} ");
          });

          return Right(objectlist);
        }
        else
          throw ServerException();
      }

      on ServerException {
        return Left(ServerFailure(message: "fail to fetch data"));
      }
    }

    else{
      return Left(ServerFailure(message: "No internet connection"));
    }
  }


}


