import 'package:jake_wharton/feature/jakes/2_domain/2_entities/Post%20Entity.dart';


class PostModel extends Post{
  //model() : super();
  PostModel({required String name,required int open_issues,required int watchers,required String language,required String description


  }):super(description: description,language: language,name: name,open_issues: open_issues,watchers: watchers);
  factory PostModel.fromjson(Map<String,dynamic> json){

    return PostModel(
      name: json["name"],
      open_issues :(json["open_issues"]??0 as num).toInt(),
      watchers   :(json["watchers"]?? 0 as num).toInt(),
      language  :json["language"]??"unknown",
      description :json["description"]??"unknown",


    );

  }
  Map<String,dynamic> tojson(){
    return {
      "name": name,
      "open_issues": open_issues,
      "watchers": watchers,
      "language": language,
      "description": description,

    };
  }

}
