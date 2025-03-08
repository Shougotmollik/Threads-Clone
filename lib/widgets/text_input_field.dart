import 'package:flutter/material.dart';
import 'package:theadsclone/utils/type_def.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.isPasswordField = false,
    required this.validatorCallback,
  });
  final String labelText;
  final String hintText;

  final TextEditingController controller;
  final bool isPasswordField;

  final ValidatorCallback validatorCallback;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validatorCallback,
      obscureText: isPasswordField,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
        label: Text(labelText),
      ),
    );
  }
}
