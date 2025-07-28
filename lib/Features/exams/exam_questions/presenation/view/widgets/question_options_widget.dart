import 'package:flutter/material.dart';

class QuestionOptions extends StatelessWidget {
  final List<String> options;
  final String? selectedValue;
  final Function(String?) onChanged;

  const QuestionOptions({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options.map((option) {
        return RadioListTile(
          value: option,
          groupValue: selectedValue,
          onChanged: onChanged,
          title: Text(option),
        );
      }).toList(),
    );
  }
}
