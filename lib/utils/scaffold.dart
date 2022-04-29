import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../others/constants.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
    showScaffoldForInternetConnectionFailure(BuildContext scaffoldContext) {
  return showScaffoldMessage(scaffoldContext, 'Internet connection fail');
}


ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showScaffoldMessage(
    BuildContext scaffoldContext, String message) {
  return Scaffold.of(scaffoldContext)
      .showSnackBar(SnackBar(content: Text(message)));
}
