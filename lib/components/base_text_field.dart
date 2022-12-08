import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class BaseTextField extends StatelessWidget {
  final String name;
  final String? hintText;
  final String? helperText;
  final String? counterText;
  final String? labelText;
  final TextInputType keyboardType;
  final bool obscureText;
  final String initialValue;
  final bool enabled;
  const BaseTextField({
    Key? key,
    required this.name,
    this.hintText,
    this.helperText,
    this.counterText,
    this.labelText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.initialValue = "",
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      key: Key(initialValue.toString()),
      name: name,
      enabled: enabled,
      obscureText: obscureText,
      keyboardType: keyboardType,
      initialValue: initialValue,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText ?? "",
        helperText: helperText ?? "",
        counterText: counterText ?? "",
        labelText: labelText ?? "",
      ),
    );
  }
}
