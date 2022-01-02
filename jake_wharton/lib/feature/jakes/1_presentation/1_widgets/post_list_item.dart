import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jake_wharton/feature/jakes/2_domain/2_entities/Post%20Entity.dart';
class PostListItem extends StatelessWidget {
  const PostListItem({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
        child:


        Row(
            mainAxisSize: MainAxisSize.max,

            children: <Widget>[
              Padding(padding: EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    "assets/lefttile.svg", width: MediaQuery
                      .of(context)
                      .size
                      .width * 15 / 100, height: MediaQuery
                      .of(context)
                      .size
                      .width * 10 / 100,)),
              Expanded(
                child: Column(mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                  [
                    Flexible(child: Text("${post.name}", softWrap: true,
                      style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold,),)),


                    Flexible(
                      child: Text("${post.description}",
                          //overflow: TextOverflow.clip,
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.normal)

                      ),
                    ),


                    Row(children: [
                      Row(children: [
                        SvgPicture.asset(
                          "assets/language.svg", width: 10, height: 10,),
                        SizedBox(width: 10,),
                        Text("${post.language}", style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal))
                      ],),
                      SizedBox(width: 10,),
                      Row(children: [
                        SvgPicture.asset(
                          "assets/bug.svg", width: 15, height: 15,),
                        SizedBox(width: 10,),
                        Text("${post.open_issues}", style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal))
                      ],),
                      SizedBox(width: 10,),
                      Row(children: [
                        SvgPicture.asset(
                          "assets/face.svg", width: 15, height: 15,),
                        SizedBox(width: 10,),
                        Text("${post.watchers}", style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal))
                      ],),


                    ],)


                  ],),
              )
            ]));
  }

}
