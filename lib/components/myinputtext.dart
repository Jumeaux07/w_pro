import 'package:flutter/material.dart';

class MyInputText extends StatelessWidget {
  const MyInputText({
    super.key, required this.placeholder, required this.label,  this.prefixIcon,  this.surfixIcon,  required this.obscureText, this.controller, required this.readonly, required this.keyboardType, required this.suffix, required this.textDirection, required this.hintTextDirection, this.maxlines = 1,
  });
  final String placeholder;
  final Widget label;
  final Widget? prefixIcon;
  final Widget? surfixIcon;
  final Widget suffix;
  final TextDirection textDirection;
  final TextDirection hintTextDirection;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool readonly;
  final int maxlines;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        readOnly: readonly,
        keyboardType: keyboardType,
        textDirection: textDirection,
        maxLines: maxlines,
        decoration: InputDecoration(
          hintText: placeholder,
          label: label,
          hintTextDirection: hintTextDirection,
          prefixIcon: prefixIcon,
          suffixIcon: surfixIcon,
          suffix: suffix,
          border: const OutlineInputBorder()
        ),
      ),
    );
  }
}