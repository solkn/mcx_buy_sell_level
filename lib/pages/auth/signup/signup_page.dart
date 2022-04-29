import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mcx_buy_sell_levels/pages/home/home_page.dart';
import 'package:mcx_buy_sell_levels/services/api_service.dart';
import 'package:mcx_buy_sell_levels/services/local_storage_service.dart';
import 'package:mcx_buy_sell_levels/utils/firebase_auth.dart';
import 'package:mcx_buy_sell_levels/utils/validators.dart';
import 'package:mcx_buy_sell_levels/widgets/auth_button.dart';
import 'package:mcx_buy_sell_levels/widgets/auth_container.dart';
import 'package:mcx_buy_sell_levels/widgets/filled_text_field.dart';


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();
  final formData = _FormData();
  final formControllers = _FormControllers();
  bool isApiInProgress = false;
  String verificationId;

  @override
  void initState() {
    super.initState();
    formControllers.phoneNumberController.addListener(() {
      if (verificationId != null &&
          formData.phoneNumber != formControllers.phoneNumberController.text) {
        verificationId = null;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AuthContainer(
      headerHeight: 200,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 16),
              Text(
                'Create New Account',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 32),
              FilledTextField(
                enabled: !isApiInProgress,
                errorText: formData.nameError,
                onSaved: (value) => formData.name = value,
                validator: isValidFullName,
                textCapitalization: TextCapitalization.words,
                labelText: 'Full Name',
                keyboardType: TextInputType.text,
                icon: Icons.person,
              ),
              SizedBox(height: 16),
              FilledTextField(
                enabled: !isApiInProgress,
                errorText: formData.emailError,
                onSaved: (value) => formData.email = value,
                validator: isValidEmail,
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                icon: Icons.email,
              ),
              SizedBox(height: 16),
              FilledTextField(
                enabled: !isApiInProgress,
                errorText: formData.passwordError,
                onSaved: (value) => formData.password = value,
                validator: isValidPassword,
                labelText: 'Password',
                obscureText: true,
                icon: Icons.vpn_key,
              ),
              SizedBox(height: 16),
              FilledTextField(
                enabled: !this.isApiInProgress,
                errorText: formData.phoneNumberError,
                onSaved: (value) => formData.phoneNumber = value,
                validator: isValidPhoneNumber,
                labelText: 'Phone Number',
                helperText: 'e.g: +91334123123',
                keyboardType: TextInputType.phone,
                controller: formControllers.phoneNumberController,
                icon: Icons.phone_android,
              ),
              if (verificationId != null) ...[
                SizedBox(height: 16),
                FilledTextField(
                  enabled: !this.isApiInProgress,
                  labelText: 'Verfication Code',
                  onSaved: (value) => formData.verificationCode = value,
                  errorText: formData.verificationCodeError,
                  keyboardType: TextInputType.number,
                  helperText: 'You will receive this code via sms',
                  validator: isValidVerificationCode,
                  icon: Icons.dialpad,
                ),
              ],
              SizedBox(height: 16),
              AuthButton(
                label: verificationId == null
                    ? 'Receive Verification Code'
                    : 'Sign Up',
                isApiInProgress: isApiInProgress,
                onPressed:
                    verificationId == null ? _receiveVerificationCode : _signup,
              ),
              SizedBox(height: 16),
              FloatingActionButton(
                onPressed: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _receiveVerificationCode() async {
    if (!formKey.currentState.validate()) {
      return;
    }
    formKey.currentState.save();
    formData.resetErrors();
    setState(() => this.isApiInProgress = true);
    try {
      this.verificationId = await firebaseAuth.verifyPhoneNumber(
          phoneNumber: formData.phoneNumber);
    //} on AuthException catch (e) {
    
    }on FirebaseAuthException catch (e){
      if (e.code == 'invalidCredential')
        formData.phoneNumberError = 'Invalid phone number';
      else
        formData.phoneNumberError = e.message;
    } catch (e) {
      formData.phoneNumberError = e.message;
    }
    setState(() => this.isApiInProgress = false);
  }

  void _signup() async {
    if (isApiInProgress || !formKey.currentState.validate()) {
      return;
    }

    formKey.currentState.save();
    setState(() {
      formData.resetErrors();
      isApiInProgress = true;
    });

    try {
      await firebaseAuth.signInWithPhoneNumber(
          verificationId, formData.verificationCode);
      print('signup');
      final authorization = await apiService.signup(formData.name,
          formData.email, formData.password, formData.phoneNumber);
      await localStorageService.saveAuthorization(authorization);
      final profile = await apiService.getProfile(formData.email);
      await localStorageService.saveProfile(profile);
      _navigateToHomeScreen(context);
    } catch (e) {
      print(e);
      if (e is PlatformException) {
        formData.verificationCodeError = 'Invalid verification code';
      } else if (e.toString().contains('Email')) {
        formData.emailError = e.message;
      } else {
        formData.phoneNumberError = e.message;
      }
      setState(() => isApiInProgress = false);
    }
  }

  void _navigateToHomeScreen(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
      (_) => false,
    );
  }
}

class _FormData {
  String name, email, password, phoneNumber, verificationCode;
  String nameError,
      emailError,
      passwordError,
      phoneNumberError,
      verificationCodeError;

  void resetErrors() {
    this.nameError = null;
    this.emailError = null;
    this.passwordError = null;
    this.phoneNumberError = null;
    this.verificationCodeError = null;
  }
}

class _FormControllers {
  final phoneNumberController = TextEditingController(text: '+91');
}
