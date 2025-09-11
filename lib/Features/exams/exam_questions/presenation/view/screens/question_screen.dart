import 'package:flutter/material.dart';
import 'package:online_exam_app_elevate/core/extensions/extensions.dart';

import '../../../../../../core/Assets/app_assets.dart';
import '../../../../../../core/routes/app_routes.dart';

import '../widgets/navigation_buttons_widget.dart';
import '../widgets/question_header_widget.dart';
import '../widgets/question_options_widget.dart';


class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<String> questions = [
    "Select the correctly punctuated sentence.",
    "Choose the correct form of the verb.",
    "Identify the proper noun in the sentence.",
  ];

  List<List<String>> options = [
    [
      "Its going to rain today.",
      "It’s going to rain today.",
      "Its going to rain today.",
      "Its going to rain today.",
    ],
    [
      "He go to school.",
      "He goes to school.",
      "He going to school.",
      "He goed to school.",
    ],
    [
      "The dog barked loudly.",
      "She ran fast.",
      "Paris is beautiful.",
      "They played football.",
    ],
  ];

  List<String?> selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    selectedAnswers = List.filled(questions.length, null);
  }

  void _nextQuestion() {
    if (_currentPage < questions.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void _previousQuestion() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Image.asset(AppAssets.ArrowIcon),
        ),
        title: const Text(
          "Exam",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        actions: [
          Row(
            children: [
              Image.asset(AppAssets.timerImage, height: 30, width: 40),
              const Text(
                "30:00",
                style: TextStyle(fontSize: 24, color: Colors.green),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: questions.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuestionHeader(
                      currentPage: _currentPage,
                      totalQuestions: questions.length,
                    ),
                    Text(
                      questions[index],
                      style: const TextStyle(fontSize: 21),
                    ),
                    const SizedBox(height: 30),
                    QuestionOptions(
                      options: options[index],
                      selectedValue: selectedAnswers[index],
                      onChanged: (value) {
                        setState(() {
                          selectedAnswers[index] = value as String;
                        });
                      },
                    ),
                    const SizedBox(height: 50),
                    NavigationButtons(
                      isFirst: _currentPage == 0,
                      isLast: _currentPage == questions.length - 1,
                      onBack: _previousQuestion,
                      onNext: () {
                        if (_currentPage == questions.length - 1) {
                          Navigator.pushNamed(context, AppRoutes.examScoreScreen);
                        } else {
                          _nextQuestion();
                        }
                      },
                    ),
                  ],
                ).setHorizontalPadding(context, 0.04);
              },
            ),
          ),
        ],
      ),
    );
  }
}
