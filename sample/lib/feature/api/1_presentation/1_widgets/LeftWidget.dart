import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/feature/api/1_presentation/3_bloc/data_bloc.dart';

import 'LeftPerson.dart';
class LeftWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width *0.8;
    return
   BlocConsumer<DataBloc,DataState>(listener:(_,__){},builder:(context,state) {
        if(state is Success) {
          return Builder(
            builder: (context) {
              return CarouselSlider(
                  options: CarouselOptions(
                     height:width ,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      scrollDirection: Axis.vertical
                    // autoPlay: false,
                  ),
                  items: List.generate(state.personlist.length, (index) {
                    return LeftPersonData(data:state.personlist[index]);
                  })

              );
            },
          );
        }
        else
         return CircularProgressIndicator();



  });
}}