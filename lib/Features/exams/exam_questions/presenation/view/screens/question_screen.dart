import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_elevate/core/extensions/extensions.dart';
import 'package:online_exam_app_elevate/core/routes/routes.dart';
import '../../../../../../core/di/di.dart';
import '../../../../../../core/l10n/translation/app_localizations.dart';
import '../../viewmodel/question_states.dart';
import '../../viewmodel/question_viewmodel.dart';
import '../widgets/timeout_dialog.dart';
import '../../../../../../core/Assets/app_assets.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../widgets/countdown_timer_widget.dart';
import '../widgets/navigation_buttons_widget.dart';
import '../widgets/question_header_widget.dart';
import '../widgets/question_options_widget.dart';

class QuestionScreen extends StatefulWidget {
  final String examId;
  final int examDuration;
  const QuestionScreen({
    super.key,
    required this.examId,
    required this.examDuration,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final PageController _pageController = PageController();

  void _showTimeoutDialog(BuildContext context) {
    final viewModel = context.read<QuestionViewModel>();
    final state = viewModel.state;

    if (state is QuestionLoaded) {
      final score = viewModel.calculateResult();

      showDialog(
        context: context,
        barrierDismissible: false,
        builder:
            (_) => TimeoutDialog(
              correctAnswers: score,
              totalQuestions: state.questions.length,
              examId: widget.examId,
              examDuration: widget.examDuration,
            ),
      );
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;

    return BlocProvider<QuestionViewModel>(
      create:
          (context) =>
              getIt<QuestionViewModel>()..fetchQuestions(widget.examId),
      child: BlocBuilder<QuestionViewModel, QuestionState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Image.asset(AppAssets.ArrowIcon),
              ),
              title: Text(
                local.examTitle,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: [
                Row(
                  children: [
                    Image.asset(AppAssets.timerImage, height: 30, width: 40),

                    if (state is QuestionLoaded)
                      CountdownTimerWidget(
                        totalMinutes: widget.examDuration,
                        onTimeOut: () => _showTimeoutDialog(context),
                      ),

                    const SizedBox(width: 10),
                  ],
                ),
              ],
            ),
            body: () {
              if (state is QuestionLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is QuestionError) {
                return Center(child: Text("Error: ${state.message}"));
              }

              if (state is QuestionLoaded) {
                final questions = state.questions;
                final selectedAnswers = state.selectedAnswers;
                final currentPage = state.currentPage;

                return Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: questions.length,
                        onPageChanged: (index) {
                          context.read<QuestionViewModel>().updateCurrentPage(
                            index,
                          );
                        },
                        itemBuilder: (context, index) {
                          final question = questions[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              QuestionHeader(
                                currentPage: currentPage,
                                totalQuestions: questions.length,
                              ),
                              Text(
                                question.question,
                                style: const TextStyle(fontSize: 21),
                              ),
                              const SizedBox(height: 30),
                              QuestionOptions(
                                options: question.answers,
                                selectedValue: selectedAnswers[index],
                                onChanged: (value) {
                                  context
                                      .read<QuestionViewModel>()
                                      .selectAnswer(index, value as String);
                                  setState(() {});
                                },
                              ),
                              const SizedBox(height: 50),
                              NavigationButtons(
                                isFirst: currentPage == 0,
                                isLast: currentPage == questions.length - 1,
                                onBack: () {
                                  context
                                      .read<QuestionViewModel>()
                                      .previousPage();
                                  _pageController.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                },
                                onNext: () {
                                  if (currentPage == questions.length - 1) {
                                    final score =
                                        context
                                            .read<QuestionViewModel>()
                                            .calculateResult();
                                     // Persist exam history on finish
                                     context.read<QuestionViewModel>().saveExamHistory(
                                       examId: widget.examId,
                                       examDurationMinutes: widget.examDuration,
                                     );
                                     Navigator.popAndPushNamed(
                                       context,
                                       AppRoutes.examScoreScreen,
                                       arguments: ExamScoreArgs(
                                         correctAnswer: score,
                                         totalQuestion: questions.length,
                                         examId: widget.examId,
                                         duration: widget.examDuration,
                                       ),
                                     );
                                  } else {
                                    context
                                        .read<QuestionViewModel>()
                                        .nextPage();
                                    _pageController.nextPage(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      curve: Curves.ease,
                                    );
                                  }
                                },
                              ),
                            ],
                          ).setHorizontalPadding(context, 0.04);
                        },
                      ),
                    ),
                  ],
                );
              }

              return const SizedBox(); // fallback
            }(),
          );
        },
      ),
    );
  }
}
