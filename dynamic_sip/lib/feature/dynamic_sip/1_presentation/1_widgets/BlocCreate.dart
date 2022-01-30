import 'package:dynamic_sip/feature/dynamic_sip/1_presentation/3_bloc/GetData%20Bloc/get_data_bloc.dart';
import 'package:dynamic_sip/feature/dynamic_sip/1_presentation/Provider/Value%20Provider/LeftRightValue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'Circle and Buttons.dart';

class BlocCreate extends StatelessWidget {
  BlocCreate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  return  BlocConsumer<GetDataBloc, GetDataState>(
      listener: (context,state){


         if (state is Success) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CircleandButtons(datalist: state.datalist)));



        }



      },

    builder: (context,state)



      {
        if (state is Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is Fail) {
          return Center(child: Text("Something went wrong"));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
