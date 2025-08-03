import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_elevate/Features/exams/domain/usecases/get_exam_detail_usecase.dart';
import 'package:online_exam_app_elevate/Features/exams/exam_subject/presentation/viewmodel/states/exam_detail_states.dart';


@injectable
class ExamDetailViewmodel extends Cubit<ExamDetailStates> {
  final GetExamDetailUseCase _examDetailUseCases;

  ExamDetailViewmodel(this._examDetailUseCases) : super(ExamsDetailInitialState());

  Future<void> getExams(String examId) async {
    emit(ExamsDetailLoadingState());

    try {
      final exams = await _examDetailUseCases(examId);
      emit(ExamsDetailSuccessState(exams));
    } catch (e) {
      emit(ExamsDetailErrorState(e.toString()));
    }
  }
}