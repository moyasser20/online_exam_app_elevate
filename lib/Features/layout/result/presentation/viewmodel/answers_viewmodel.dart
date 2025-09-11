import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../exams/domain/usecases/get_exam_questions_usecase.dart';
import 'answers_states.dart';

@injectable
class AnswersViewModel extends Cubit<AnswersState> {
  final GetExamQuestionsUseCase getQuestions;
  AnswersViewModel(this.getQuestions) : super(AnswersInitial());

  Future<void> load(String examId, List<String?> selectedAnswers) async {
    emit(AnswersLoading());
    try {
      final qs = await getQuestions.call(examId);
      emit(AnswersLoaded(questions: qs, selectedAnswers: selectedAnswers));
    } catch (e) {
      emit(AnswersError(e.toString()));
    }
  }
}

