import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sample/feature/api/1_presentation/3_bloc/data_bloc.dart';

import 'LeftWidget.dart';

class ContentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 2;
    return BlocBuilder<DataBloc, DataState>(builder: (context, state) {
      if (state is DataInitial) {
        return Text("Loading");
      }
      if (state is Loading) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is FailureinFetching) {
        return Text("Failure ${state.message}");
      }
      if (state is Success) {
        return Column(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(alignment: AlignmentDirectional.center,
              children: [
                Row(
                // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        width: width,
                        child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      'assets/left.png',
                                      width: width,
                                      height: width,
                                      fit: BoxFit.cover,
                                    )),
                                Text(
                                  "Uddesh Rajoriya",
                                  textScaleFactor: 1.2,
                                ),
                                Text("Gwaliar, india"),
                                Text("Religion :Hindu"),
                                ElevatedButton(
                                    onPressed: () {}, child: Text("My Visitors"))
                              ],
                            ))),
                    Container(
                        width: width,
                        child: Padding(padding:EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [LeftWidget()],
                          ),
                        ))
                  ],
                ),

                Positioned(

                  left: width-50,
                  top: width-125,
                  child: SvgPicture.asset("assets/heart.svg",width: 80,height: 80))

              ],
            ),
            Container(height: 60,)
          ],
        );
      }

      return CircularProgressIndicator();
    });
  }
}
