import 'package:auth_using_mobile_no/feature/auth/1_presentation/1_widgets/custum%20text.dart';
import 'package:auth_using_mobile_no/feature/auth/1_presentation/2_pages/route.dart';
import 'package:auth_using_mobile_no/feature/auth/1_presentation/3_bloc/LogicHandlingBloc/signin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class TakeMobileNo extends StatelessWidget {
     TakeMobileNo();
   late String mobileno;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: Column(children: [ SizedBox(height: 10),

        CustomText(size: 15,fontWeight: FontWeight.bold,text:  'please Enter your Mobile no'),
        SizedBox(height: 10),
        CustomText(size: 10,fontWeight: FontWeight.bold,text:  'You’ll receive a 4 digit code'),
        CustomText(size: 10,fontWeight: FontWeight.bold,text:  'to verify next.'),

        SizedBox(height: 10),


        IntlPhoneField(initialCountryCode: "ind",
          decoration: InputDecoration(
            labelText: 'Phone Number',
            border: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
          ),
          onChanged: (phone) {
            mobileno=phone.completeNumber;
            print(phone.completeNumber);
          },
          onCountryChanged: (phone) {

          },
        ),
        ElevatedButton(
        onPressed: () {
          if(mobileno!=null) {
            print("event added");
            BlocProvider.of<SigninBloc>(context).add(verify(mobile_number:mobileno));

            }
         Navigator.of(context)?.pushNamed(
            RouteGenerator.capturecode
           );
        }, child: Text("CONTINUE"),)



      ],),
    );
  }
}
