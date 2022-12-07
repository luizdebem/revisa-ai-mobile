import 'package:flutter/material.dart';

class BaseButton extends StatefulWidget {
  final void Function()? onPressed;
  final Widget child;
  final bool highlighted;
  const BaseButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.highlighted = false,
  }) : super(key: key);

  @override
  State<BaseButton> createState() => _BaseButtonState();
}

class _BaseButtonState extends State<BaseButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: widget.highlighted
          ? ElevatedButton.styleFrom(primary: Colors.amber)
          : ElevatedButton.styleFrom(),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: widget.child,
      ),
    );
  }
}
