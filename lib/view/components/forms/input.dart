import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyInput extends StatelessWidget {
  const MyInput({
    super.key,
    required this.label,
    required this.controller,
    required this.validator,
    this.obscureText,
    this.inputFormatters,
  });
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      validator: validator,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        filled: true,
        label: Text(label),
      ),
    );
  }
}
