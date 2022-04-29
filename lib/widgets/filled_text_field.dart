import 'package:flutter/material.dart';

class FilledTextField extends StatelessWidget {
  final String labelText;
  final String helperText;
  final String errorText;
  final bool obscureText;
  final TextInputType keyboardType;
  final FormFieldValidator<String> validator;
  final FormFieldSetter<String> onSaved;
  final bool enabled;
  final String initialValue;
  final Key key;
  final TextCapitalization textCapitalization;
  final Color textColor;
  final Color helperTextColor;
  final Color errorTextColor;
  final TextEditingController controller;
  final IconData icon;

  FilledTextField(
      {@required this.labelText,
      this.initialValue,
      this.helperText,
      this.errorText,
      this.errorTextColor,
      this.validator,
      this.onSaved,
      this.obscureText = false,
      this.enabled = true,
      this.keyboardType = TextInputType.text,
      this.textCapitalization = TextCapitalization.none,
      this.textColor = Colors.white,
      this.helperTextColor = Colors.white,
      this.key,
      this.controller,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final outlineBorderFocused =
        OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent));
    return TextFormField(
      controller: this.controller,
      textCapitalization: this.textCapitalization,
      initialValue: this.initialValue,
      validator: this.validator,
      onSaved: this.onSaved,
      keyboardType: this.keyboardType,
      style: TextStyle(color: textColor),
      cursorColor: this.textColor,
      enabled: this.enabled,
      decoration: InputDecoration(
        prefixIcon: Icon(
          this.icon,
          color: this.textColor,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        hintText: this.labelText,
        helperText: this.helperText,
        helperStyle: TextStyle(color: helperTextColor.withOpacity(0.8)),
        errorText: this.errorText,
        labelStyle: TextStyle(color: textColor.withOpacity(0.8)),
        hintStyle: TextStyle(color: textColor.withOpacity(0.8)),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: outlineBorderFocused,
        disabledBorder: outlineBorderFocused,
        enabledBorder: outlineBorderFocused,
        errorBorder: outlineBorderFocused,
        focusedBorder: outlineBorderFocused,
        focusedErrorBorder: outlineBorderFocused,
        errorStyle: TextStyle(color: errorTextColor),
      ),
      obscureText: this.obscureText,
    );
  }
}
