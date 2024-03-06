import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;

  final Function(String)? onChanged;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hinttext,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   TextField(
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: hinttext,
        filled: true,
      ),
      onChanged:  onChanged
    );
  }
}
