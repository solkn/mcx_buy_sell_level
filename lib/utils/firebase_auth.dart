import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class _FirebaseAuth {
  Future<String> verifyPhoneNumber({@required String phoneNumber}) async {
    final completer = Completer<String>();

    FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(),
        verificationCompleted: (phoneAuthCredential) {
          debugPrint('verificationCompleted');
        },
        verificationFailed: (authException) =>
            completer.completeError(authException),
        codeSent: (verificationId, [force]) =>
            completer.complete(verificationId),
        codeAutoRetrievalTimeout: (verificationId) {
          debugPrint('codeAutoRetrievalTimeout');
        });
    return completer.future.timeout(
        Duration(
          seconds: 5,
        ), onTimeout: () {
      print('timeout');
      throw Exception('Connection timeout');
    });
  }

  Future<String> signInWithPhoneNumber(String verificationId, String verificationCode) async {
   
   PhoneAuthCredential credential   = PhoneAuthProvider.credential(
     verificationId: verificationId, smsCode: verificationCode);

     await FirebaseAuth.instance.signInWithCredential(credential);

    // await FirebaseAuth.channel.invokeMethod<Map<dynamic, dynamic>>('signInWithPhoneNumber', {
    //   'verificationId': verificationId,
    //   'smsCode': verificationCode,
    //   'app': FirebaseAuth.instance.app.name,
    // });


  //   final map = await FirebaseAuth.channel.invokeMethod('getIdToken', {
  //     'refresh': true,
  //     'app': FirebaseAuth.instance.app.name,
  //   });
  //   return map['token'];

      return 'token';
   }
}

final firebaseAuth =  _FirebaseAuth();
