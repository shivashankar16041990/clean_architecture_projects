import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jake_wharton/core/error/exception.dart';
import 'package:jake_wharton/feature/jakes/3_data/2_models/Post%20model.dart';

abstract class RemoteDataSource {


  Future<List<PostModel>> getDataFromApi(int page_index,int per_page);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

RemoteDataSourceImpl({required this.client});


  @override
  Future<List<PostModel>> getDataFromApi(int page_index,int per_page) async {

  final response = await client.get(
      Uri.parse(
          "https://api.github.com/users/JakeWharton/repos?page=$page_index&per_page=$per_page?json")
  );
  if (response.statusCode == 200) {
    List<dynamic> listresponse = jsonDecode(response.body);
   List<PostModel> objectlist = List.empty(growable: true);
    if (listresponse == null)
     {
       return objectlist;
     }
    objectlist = listresponse.map((e) => PostModel.fromjson(e)).toList();
    return objectlist ;
}

else
    throw ServerException();
  }


}
