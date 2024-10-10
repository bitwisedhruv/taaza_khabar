import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String authFieldText;
  final TextEditingController controller;
  final bool isObscure;
  const AuthField({
    super.key,
    required this.authFieldText,
    required this.controller,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
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
