import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/exams/exam_questions/presenation/viewmodel/question_states.dart';
import '../../../domain/usecases/get_exam_questions_usecase.dart';

@injectable
class QuestionViewModel extends Cubit<QuestionState> {
  final GetExamQuestionsUseCase getExamQuestionsUseCase;

  QuestionViewModel(this.getExamQuestionsUseCase) : super(QuestionInitial());

  List<String?> selectedAnswers = [];
  int currentPage = 0;

  Future<void> fetchQuestions(String examId) async {
    emit(QuestionLoading());
    try {
      final questions = await getExamQuestionsUseCase.call(examId);
      selectedAnswers = List.filled(questions.length, null);
      emit(QuestionLoaded(
        questions: questions,
        selectedAnswers: selectedAnswers,
        currentPage: 0,
      ));
    } catch (e) {
      emit(QuestionError(e.toString()));
    }
  }

  void selectAnswer(int index, String answer) {
    if (state is QuestionLoaded) {
      selectedAnswers[index] = answer;
      emit((state as QuestionLoaded).copyWith(selectedAnswers: selectedAnswers));
    }
  }

  void updateCurrentPage(int newIndex) {
    if (state is QuestionLoaded) {
      final loadedState = state as QuestionLoaded;
      emit(loadedState.copyWith(currentPage: newIndex));
    }
  }

  void nextPage() {
    if (state is QuestionLoaded) {
      final total = (state as QuestionLoaded).questions.length;
      if (currentPage < total - 1) {
        currentPage++;
        emit((state as QuestionLoaded).copyWith(currentPage: currentPage));
      }
    }
  }

  void previousPage() {
    if (state is QuestionLoaded) {
      if (currentPage > 0) {
        currentPage--;
        emit((state as QuestionLoaded).copyWith(currentPage: currentPage));
      }
    }
  }

  int calculateResult() {
    final currentState = state;
    if (currentState is! QuestionLoaded) return 0;

    final questions = currentState.questions;
    final selectedAnswers = currentState.selectedAnswers;

    int score = 0;

    for (int i = 0; i < questions.length; i++) {
      final question = questions[i];
      final selected = selectedAnswers[i];

      if (selected == null) continue;

      if (question.type == 'single_choice') {
        if (selected == question.correct) {
          score++;
        }
      }
      else if (question.type == 'multiple_choice') {
        final correctList = question.correct.split(',')..sort();
        final selectedList = selected.split(',')..sort();

        if (_listsEqual(correctList, selectedList)) {
          score++;
        }
      }

    }

    return score;
  }
}

bool _listsEqual(List<String> a, List<String> b) {
  if (a.length != b.length) return false;
  for (int i = 0; i < a.length; i++) {
    if (a[i].trim() != b[i].trim()) return false;
  }
  return true;
}
