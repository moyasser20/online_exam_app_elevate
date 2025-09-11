import 'package:flutter/material.dart';
import 'package:online_exam_app_elevate/core/extensions/extensions.dart';
import 'package:online_exam_app_elevate/Features/exams/domain/entity/question_entity.dart';
import '../../../../../../core/theme/app_colors.dart';

class AnswersScreen extends StatelessWidget {
  final List<QuestionEntity>? questions;
  final List<String?>? selectedAnswers;

  const AnswersScreen({super.key, this.questions, this.selectedAnswers});

  Color _tileBg({required bool isCorrect, required bool isSelected}) {
    if (isCorrect) return Colors.green.shade100;
    if (isSelected && !isCorrect) return Colors.red.shade100;
    return Colors.grey.shade200;
  }

  Color _tileBorder({required bool isCorrect, required bool isSelected}) {
    if (isCorrect) return Colors.green;
    if (isSelected && !isCorrect) return Colors.red;
    return Colors.transparent;
  }

  Icon _leading({required bool isCorrect, required bool isSelected}) {
    if (isCorrect) return const Icon(Icons.check_box, color: Colors.green);
    if (isSelected && !isCorrect) {
      return const Icon(Icons.indeterminate_check_box, color: Colors.red);
    }
    return const Icon(Icons.check_box_outline_blank, color: Colors.blue);
  }

  @override
  Widget build(BuildContext context) {
    final qList = questions ?? [];
    final sel = selectedAnswers ?? List<String?>.filled(qList.length, null);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                const Text(
                  "Answers",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Expanded(
              child: ListView.builder(
                itemCount: qList.length,
                itemBuilder: (context, index) {
                  final question = qList[index];
                  final selected = sel.elementAt(index);
                  final correctKey = question.correct;

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            question.question,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Column(
                            children:
                                question.answers.map((opt) {
                                  final bool isCorrect =
                                      opt.key == correctKey ||
                                      (question.type == 'multiple_choice' &&
                                          correctKey
                                              .split(',')
                                              .contains(opt.key));
                                  final bool isSelected =
                                      selected?.split(',').contains(opt.key) ??
                                      false;

                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _tileBg(
                                        isCorrect: isCorrect,
                                        isSelected: isSelected,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: _tileBorder(
                                          isCorrect: isCorrect,
                                          isSelected: isSelected,
                                        ),
                                      ),
                                    ),
                                    child: ListTile(
                                      leading: _leading(
                                        isCorrect: isCorrect,
                                        isSelected: isSelected,
                                      ),
                                      title: Text(opt.answer),
                                    ),
                                  );
                                }).toList(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ).setHorizontalAndVerticalPadding(context, 0.04, 0.012),
      ),
    );
  }
}
