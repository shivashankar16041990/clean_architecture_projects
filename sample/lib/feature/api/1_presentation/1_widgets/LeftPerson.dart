import 'package:flutter/material.dart';
import 'package:sample/feature/api/2_domain/2_entities/entity.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
class LeftPersonData extends StatelessWidget{
  Data data;

  LeftPersonData({required this.data});
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width/2;


    return Column(children: [ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset('assets/right.png',width: width,height: width,fit: BoxFit.cover,)),

    Text(data.name),
      Text(data.email),
      Text(data.gender),
      Text(data.status),


    ],);
  }

}