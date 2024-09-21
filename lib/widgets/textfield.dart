import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String labeltext;
  final TextEditingController controller;
  final Icon prefixicon;

  TextFieldCustom(
      {required this.labeltext,
      required this.controller,
      required this.prefixicon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextField(
        controller: controller,
        obscureText: false,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: labeltext,
            prefixIcon: prefixicon),
      ),
    );
  }
}
