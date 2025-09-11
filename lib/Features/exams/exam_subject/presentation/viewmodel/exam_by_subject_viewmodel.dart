import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/exams/domain/usecases/get_exam_by_subject_usecase.dart';
import 'package:online_exam_app_elevate/Features/exams/exam_subject/presentation/viewmodel/states/exam_by_subject_states.dart';

@injectable
class ExamBySubjectViewmodel extends Cubit<ExamBySubjectStates> {
  final GetExamBySubjectUseCase _examSubjectUseCases;

  ExamBySubjectViewmodel(this._examSubjectUseCases)
    : super(ExamsBySubjectInitialState());

  Future<void> getExams(String subjectId) async {
    emit(ExamsBySubjectLoadingState());

    try {
      final exams = await _examSubjectUseCases(subjectId);
      emit(ExamsBySubjectSuccessState(exams));
    } catch (e) {
      emit(ExamsBySubjectErrorState(e.toString()));
    }
  }
}
