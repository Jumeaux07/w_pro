import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DropdownField extends StatefulWidget {
   DropdownField({
    Key? key,
    required this.options,
    required this.label,
    this.selectedOption,
  }) : super(key: key);
  final List<String> options;
  String? selectedOption;
  final String label;
  @override
  _DropdownFieldState createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: // Champs de sélection
            DropdownButtonFormField<String>(
              onChanged: (String? value) {
                setState(() {
                  widget.selectedOption = value!;
                });
              },
              value: widget.selectedOption,
              isExpanded: true,
              items: widget.options.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: widget.label,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez sélectionner une option';
                }
                return null;
              },
            ),
    );
  }
}
