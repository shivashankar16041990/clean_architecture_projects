import 'package:auth_using_mobile_no/core/util/locale.dart';
import 'package:auth_using_mobile_no/feature/auth/1_presentation/1_widgets/custum%20text.dart';
import 'package:auth_using_mobile_no/feature/auth/1_presentation/2_pages/route.dart';
import 'package:auth_using_mobile_no/feature/auth/1_presentation/3_bloc/LanguageHandlingCubit/change_language_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 15),
          SvgPicture.asset(
            "assets/icon22.svg",
            width: 40,
            height: 40,
            placeholderBuilder: (_) => const CircularProgressIndicator(),
          ),
          SizedBox(height: 10),
          CustomText(
              size: 15,
              fontWeight: FontWeight.bold,
              text: 'Please Select Your Language'),
          SizedBox(height: 4),
          CustomText(size: 10,fontWeight: FontWeight.bold,text: 'you can Change the language '),
          CustomText(
              size: 10, fontWeight: FontWeight.bold, text: 'at any time'),
          SizedBox(height: 10),
          DorpDownButtoncustum(context),
          SizedBox(height: 10),
          Padding(padding: EdgeInsets.only(left: 30,right:30),
            child: Row(
              children: [Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(RouteGenerator.takemobileno);
                  },
                  child: Text("Next"),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all
                    < RoundedRectangleBorder>
                      (RoundedRectangleBorder(side: BorderSide(width: 1)))          ,
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.black,
                      ),
                      //button color
                      foregroundColor: MaterialStateProperty.all<Color>(
                        Color(0xffffffff),
                      )),

                ),
              )],
            ),
          ),
          SizedBox(height: 100),







        Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SvgPicture.asset(
            "assets/bottom.svg",
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
          )
        ],
      )










        ],
      )),
    );
  }

  Widget DorpDownButtoncustum(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: 30,right: 30),
      child: Container(decoration: BoxDecoration(border: Border.all(width: 2)),
        child: DropdownButton<String>(

          isExpanded: true,
          value: LocaleList.name[context.watch<ChangeLanguageBloc>().state],
          items: LocaleList.name.map<DropdownMenuItem<String>>((String value) {

            return DropdownMenuItem<String>(
              value: value,
              child: Text("  $value"),
            );
          }).toList(),
          onChanged: (String? newValue) {

            var index = LocaleList.name.indexOf(newValue!);

            context.read<ChangeLanguageBloc>().add(ChangeLanguage(index: index));
          },
        ),
      ),
    );
    /*String dropdownValue = 'One';


*/
  }
}
