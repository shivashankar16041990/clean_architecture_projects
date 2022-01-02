import 'package:hive/hive.dart';
import 'package:jake_wharton/core/error/exception.dart';
import 'package:jake_wharton/feature/jakes/2_domain/2_entities/Post%20Entity.dart';
import 'package:jake_wharton/feature/jakes/3_data/2_models/Post%20model.dart';
import 'package:jake_wharton/feature/jakes/3_data/2_models/list_to_store.dart';

abstract class LocalDataSource{
  Future<List<Post>> getDataFromLocal(int page_index);
  Future<void> cacheData(List<Post> cachetoLocal,int page_index);
}
class LocalDataSourceImpl implements LocalDataSource{

  Box<ListToStore> box;
  LocalDataSourceImpl({required this.box});

  @override
  Future<void> cacheData(List<Post> cachetoLocal,int page_index) async{


    if(!await box.containsKey(page_index-1)){
      await box.add( ListToStore(postlist:cachetoLocal));

    }

  }

  @override
  Future<List<Post>> getDataFromLocal(int page_index) async{

    try{

      final postlist=(await box.getAt(page_index-1))!.postlist;

      if(postlist==null){


        return List<PostModel>.empty() ;
      }
      else{



        return postlist  ;
      }


    }
    catch(e)
    {
      throw CacheException();
    }


  }










}
