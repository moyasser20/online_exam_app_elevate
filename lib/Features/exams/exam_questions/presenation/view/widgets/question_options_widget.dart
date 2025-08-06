import 'package:flutter/material.dart';
import '../../../../domain/entity/answers_entity.dart';

class QuestionOptions extends StatelessWidget {
  final List<AnswersEntity> options;
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
          value: option.key,
          groupValue: selectedValue,
          onChanged: onChanged,
          title: Text(option.answer),
        );
      }).toList(),
    );
  }
}
