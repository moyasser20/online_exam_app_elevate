import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/di/di.dart';
import '../../../presentation/viewmodel/answers_viewmodel.dart';
import '../../../presentation/viewmodel/answers_states.dart';
import 'answer_screen.dart';

class AnswersLoaderScreen extends StatelessWidget {
  final String examId;
  final List<String?> selectedAnswers;

  const AnswersLoaderScreen({super.key, required this.examId, required this.selectedAnswers});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AnswersViewModel>(
      create: (_) => getIt<AnswersViewModel>()..load(examId, selectedAnswers),
      child: BlocBuilder<AnswersViewModel, AnswersState>(
        builder: (context, state) {
          if (state is AnswersLoading || state is AnswersInitial) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          if (state is AnswersError) {
            return Scaffold(body: Center(child: Text(state.message)));
          }
          final loaded = state as AnswersLoaded;
          return AnswersScreen(questions: loaded.questions, selectedAnswers: loaded.selectedAnswers);
        },
      ),
    );
  }
}

