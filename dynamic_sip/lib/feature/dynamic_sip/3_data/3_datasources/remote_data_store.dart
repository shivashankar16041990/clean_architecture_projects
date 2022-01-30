import 'dart:convert';
import 'package:dynamic_sip/core/error/exception.dart';
import 'package:dynamic_sip/feature/dynamic_sip/2_domain/2_entities/Entity.dart';
import 'package:http/http.dart' as http;


abstract class RemoteDataSource {


  Future<List<Dsip>> getDataFromApi();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

RemoteDataSourceImpl({required this.client});


  @override
  Future<List<Dsip>> getDataFromApi() async {

  final response = await client.get(
      Uri.parse(
          "https://interview-d8bf8-default-rtdb.firebaseio.com/dsip.json")
  );
  if (response.statusCode == 200) {
print("${response.body}");
    List<dynamic> listresponse = jsonDecode(response.body);
   List<Dsip> objectlist = List.empty(growable: true);
    if (listresponse == null)
     {
       return objectlist;
     }
    objectlist = listresponse.map((e) => Dsip.fromJson(e)).toList();
    return objectlist ;
}

else
    throw ServerException();
  }


}
