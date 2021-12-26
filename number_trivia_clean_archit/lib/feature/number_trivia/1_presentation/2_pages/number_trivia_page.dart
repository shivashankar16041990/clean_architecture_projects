import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/1_presentation/1_widgets/display_message.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/1_presentation/1_widgets/loadingwidget.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/1_presentation/1_widgets/trivia_controls.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/1_presentation/1_widgets/trivia_display.dart';
import 'package:number_trivia_clean_archit/feature/number_trivia/1_presentation/3_bloc/number_trivia_bloc.dart';

import '../../../../injection_controller.dart';

class NumberTriviaPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Trivia"),),body: SingleChildScrollView(child: BuildBody(context),),);
  }

Widget BuildBody(BuildContext context) {
    return  Center(child:
      Padding(padding: EdgeInsets.all(10),child: Column(children: [
        SizedBox(height: 10,),BlocBuilder<NumberTriviaBloc,NumberTriviaState>(builder:
        (context,state){
          if(state is Empty){
              return DisplayMessage(message:"Start Searching");

          }
          else if(state is Loading){
            return LoadingWidget();

          }
          else if (state is Loaded){
            return DisplayTrivia(numberTrivia:state.numberTrivia);
          }
          else if(state is Error){
            return DisplayMessage(message:state.message);
          }
          return DisplayMessage(message:"Start Searching");
        }
        ),

        SizedBox(height: 10,),
        TriviaControls()

      ],),)

    )
    ;


 }

}

