import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  String text;
  VoidCallback onPressed;

  DefaultButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(text),
      color: Theme.of(context).primaryColor,
    );
  }
}
