import 'package:flutter/material.dart';

String isValidEmail(String value) {
  if (value.isEmpty) {
    return 'Email is required';
  }
  final emailRegex = RegExp(r"[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}" +
      "\\@" +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
      "(" +
      "\\." +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
      ")+");
  if (!emailRegex.hasMatch(value)) {
    return 'Enter valid email';
  }
  return null;
}


String isValidPassword(String value) {
  if (value.isEmpty) {
    return 'Password is required';
  }
  return null;
}

String isValidFullName(String value) {
  if (value.isEmpty) {
    return 'Full name is required';
  }
  return null;
}

String isValidVerificationCode(String value) {
  if (value.isEmpty) {
    return 'Verfication code is required';
  }
  return null;
}

String isValidPhoneNumber(String value) {
  if (value.isEmpty) {
    return 'Phone number is required';
  }
  final phoneRegex = RegExp(r"^(\+\d{1,3}?)?\d{10}$");
  if (!phoneRegex.hasMatch(value)) {
    return 'Enter valid phone number';
  }
  return null;
}

FormFieldValidator<String> isRequired(String error) {
  return (value) {
    if (value.isEmpty) {
      return error;
    } else {
      return null;
    }
  };
}
