import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class BaseTextField extends StatefulWidget {
  final String name;
  final String? hintText;
  final String? helperText;
  final String? counterText;
  final String? labelText;
  final bool obscureText;
  const BaseTextField({
    Key? key,
    required this.name,
    this.hintText,
    this.helperText,
    this.counterText,
    this.labelText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: widget.hintText ?? "",
        helperText: widget.helperText ?? "",
        counterText: widget.counterText ?? "",
        labelText: widget.labelText ?? "",
      ),
    );
  }
}
