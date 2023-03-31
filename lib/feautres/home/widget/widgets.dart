import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;

  MyButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}

class MyTextField extends StatelessWidget {
  final String hintText;

  MyTextField({required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
