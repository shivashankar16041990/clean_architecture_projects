import 'dart:async';

import 'package:auth_using_mobile_no/core/error/falilure.dart';
import 'package:auth_using_mobile_no/feature/auth/1_presentation/3_bloc/LanguageHandlingCubit/smscode.dart';
import 'package:auth_using_mobile_no/feature/auth/1_presentation/3_bloc/automatic_sms_bloc.dart';
import 'package:auth_using_mobile_no/feature/auth/2_domain/2_entities/user.dart';
import 'package:auth_using_mobile_no/feature/auth/2_domain/3_repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:auth_using_mobile_no/feature/auth/2_domain/2_entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyUsingPhone implements UserRepository {
  final automaticSmsBloc= AutomaticSmsBloc();

  @override
  Future<Either<Failure, AuthStatus>> Register(dynamic phone_number) async {
    try {
      print(phone_number);
      final auth = await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phone_number,
          verificationCompleted: (PhoneAuthCredential credential) async {
            // ANDROID ONLY!
            print("inside verificationCompleted");
            // Sign the user in (or link) with the auto-generated credential
            await FirebaseAuth.instance.signInWithCredential(credential);
          },
          verificationFailed: (FirebaseAuthException e) {
            print("verificationFailed");
            if (e.code == 'invalid-phone-number') {
              print('The provided phone number is not valid.');
            }
          },
          codeSent: (String verificationId, int? resendToken) async {
            print('inside codeSent');
            /*BlocListener<AutomaticSmsBloc, AutomaticSmsState>(
                listener: (context, state) async{
                  if (state is received_sms) {
                    print('inside codeSent');
                    print("sms code is received inverifyphoneno $state.code");
                    PhoneAuthCredential credential = PhoneAuthProvider
                        .credential(
                        verificationId: verificationId, smsCode: state.code);

                    //Sign the user in (or link) with the credential
                    final logincredential = await FirebaseAuth.instance
                        .signInWithCredential(credential);
                    print("login credentials are  ${(logincredential.credential
                        ?.signInMethod)},  ${logincredential.user
                        ?.phoneNumber}");
                  }
                });},*/
            //StreamSubscription

           Smscode().smscode.future.then((value)
              async{

                print('inside codeSent');
                  print("sms code is received inverifyphoneno $value");
                PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode:value);

                //Sign the user in (or link) with the credential
                final logincredential= await FirebaseAuth.instance.signInWithCredential(credential);
                print("login credentials are  ${(logincredential.credential?.signInMethod)},  ${logincredential.user?.phoneNumber},${logincredential.credential?.signInMethod}"  );
            });},







         // Create a PhoneAuthCredential with the code



      codeAutoRetrievalTimeout: (String verificationId) {},
          timeout: const Duration(seconds: 120));

      return Right(AuthStatus.Register);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthStatus>> SignIn(dynamic code) async {
    try {
      FirebaseAuth.instance.signInWithPhoneNumber(code.toString());
      return Right(AuthStatus.SignIn);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthStatus>> SignOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return Right(AuthStatus.SignOut);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
