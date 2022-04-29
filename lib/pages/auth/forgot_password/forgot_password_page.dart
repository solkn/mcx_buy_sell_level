import 'package:flutter/material.dart';

import '../../../widgets/auth_container.dart';
import '../../../widgets/filled_text_field.dart';
import '../../../widgets/auth_button.dart';
import '../../../services/api_service.dart';
import '../../../utils/dialogs.dart';
import '../../../utils/validators.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final formData = _FormData();
  bool isApiInProgress = false;

  @override
  Widget build(BuildContext context) {
    return AuthContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 16),
              Text(
                'Reset Your Password',
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
              Row(
                children: [
                  Expanded(
                    child: AuthButton(
                      label: 'Reset password',
                      onPressed: _onResetPassword,
                      isApiInProgress: isApiInProgress,
                    ),
                  ),
                ],
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

  void _onResetPassword() async {
    if (isApiInProgress || !formKey.currentState.validate()) return;
    formKey.currentState.save();
    setState(() => isApiInProgress = true);
    try {
      await apiService.forgotPassword(formData.email);
      showInfoDialog(context,
          title: 'Password Reset!',
          message:
              'We have sent you email with your new password. Please check your spam if you didnt find email in your inbox.',
          onOk: () {
        Navigator.pop(context);
      });
    } catch (e) {
      formData.emailError = e.message;
    }
    setState(() => isApiInProgress = false);
  }
}

class _FormData {
  String email;
  String emailError;

  void resetErrors() {
    this.emailError = null;
  }
}
