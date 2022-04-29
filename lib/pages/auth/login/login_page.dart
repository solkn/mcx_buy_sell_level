import 'package:flutter/material.dart';

import '../forgot_password/forgot_password_page.dart';
import '..//signup/signup_page.dart';
import '../../../widgets/auth_container.dart';
import '../../../widgets/filled_text_field.dart';
import '../../../widgets/auth_button.dart';
import '../../../utils/fade_route.dart';
import '../../../utils/validators.dart';
import '../../../services/api_service.dart';
import '../../../services/local_storage_service.dart';
import '../../../models/data/profile_data.dart';
import '../../home/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final formData = _FormData();
  bool isApiInProgress = false;

  @override
  Widget build(BuildContext context) {
    return  AuthContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 16),
              Text(
                'Login To Your Account',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 32),
              FilledTextField(
                validator: isValidEmail,
                errorText: formData.emailError,
                onSaved: (value) => formData.email = value,
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                enabled: !isApiInProgress,
                icon: Icons.email,
              ),
              SizedBox(height: 16),
              FilledTextField(
                validator: isValidPassword,
                errorText: formData.passwordError,
                onSaved: (value) => formData.password = value,
                labelText: 'Password',
                obscureText: true,
                enabled: !isApiInProgress,
                icon: Icons.vpn_key,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: AuthButton(
                      label: 'Sign In',
                      isApiInProgress: isApiInProgress,
                      onPressed: _onSignIn,
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: _onForgotPassword,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              FloatingActionButton(
                onPressed: _onSignup,
                child: Icon(
                  Icons.add,
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

  void _onSignIn() async {
    if (isApiInProgress || !formKey.currentState.validate()) return;
    formKey.currentState.save();
    formData.resetErrors();
    setState(() => isApiInProgress = true);

    try {
      final authorization =
          await apiService.login(formData.email, formData.password);
      await localStorageService.saveAuthorization(authorization);
      final profile = await apiService.getProfile(formData.email);
      await localStorageService.saveProfile(profile);
      _navigateToHome(context, profile);
    } catch (e) {
      if (e.toString().contains('Password')) {
        formData.passwordError = e.message;
      } else {
        formData.emailError = e.message;
      }
      setState(() => isApiInProgress = false);
    }
  }

  void _navigateToHome(BuildContext context, ProfileData profile) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
      (_) => false,
    );
  }

  void _onSignup() {
    if (this.isApiInProgress) {
      return;
    }
    Navigator.push(
      context,
      FadeRoute(
        page: SignupPage(),
      ),
    );
  }

  void _onForgotPassword() {
    if (this.isApiInProgress) {
      return;
    }
    Navigator.push(
      context,
      FadeRoute(
        page: ForgotPasswordPage(),
      ),
    );
  }
}

class _FormData {
  String email, password;
  String emailError, passwordError;

  void resetErrors() {
    this.emailError = null;
    this.passwordError = null;
  }
}
