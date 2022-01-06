
import 'package:equatable/equatable.dart';

class Data extends Equatable {
int id;
String name,email,gender,status;

Data({required this.status,required this.name,required this.id,required this.email,required this.gender});


@override
List<Object> get props => [name,email,gender,status,id];
factory Data.fromjson(Map<String,dynamic> json){
  return Data(
    name: json["name"],
    id :(json["id"] as num).toInt(),
    email   :json["email"] ,
    gender  :json["gender"],
    status :json["status"],


  );
}
}
