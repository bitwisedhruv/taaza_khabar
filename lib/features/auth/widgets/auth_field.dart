import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String authFieldText;
  final TextEditingController controller;
  final bool isObscure;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  const AuthField({
    super.key,
    required this.authFieldText,
    required this.controller,
    this.isObscure = false,
    required this.keyboardType,
    this.textCapitalization = TextCapitalization.sentences,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        hintText: authFieldText,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "$authFieldText cannot be empty";
        }
        return null;
      },
    );
  }
}
