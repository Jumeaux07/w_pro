import 'package:flutter/material.dart';

class Inputtext extends StatelessWidget {
  const Inputtext({
    super.key,
    required this.label,
    required this.placeholder,
    this.controller,
    required this.prefix,
    required this.pass,
    this.sufix,
    this.length,
    required this.keyboaedtype,
  });
  final String label;
  final String placeholder;
  final TextEditingController? controller;
  final Widget prefix;
  final Widget? sufix;
  final bool pass;
  final int? length;
  final TextInputType keyboaedtype;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: length,
      keyboardType: keyboaedtype,
      obscureText: pass,
      controller: controller,
      decoration: InputDecoration(
          hintText: placeholder,
          label: Text(label),
          prefixIcon: prefix,
          suffixIcon: sufix,
          border: const OutlineInputBorder()),
    );
  }
}
