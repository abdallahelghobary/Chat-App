import 'package:flutter/material.dart';

class CustomInputText extends StatelessWidget {
  const CustomInputText({super.key, required this.hientText});
  final String hientText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.amber,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hientText,
        hintStyle: TextStyle(color: Colors.amber),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),

        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}
