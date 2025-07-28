import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_elevate/Features/exams/domain/usecases/get_all_subject_usecase.dart';
import 'package:online_exam_app_elevate/Features/exams/exam_subject/viewmodel/get_all_subject_states.dart';

class GetAllSubjectViewModel extends Cubit<GetAllSubjectStates> {
  final GetAllSubjectUseCases _allSubjectUseCases;

  GetAllSubjectViewModel(this._allSubjectUseCases) : super(GetAllSubjectInitialState());

  Future<void> getAllSubject() async {
    emit(GetAllSubjectLoadingState());

    try {
      final subjects = await _allSubjectUseCases();
      emit(GetAllSubjectSuccessState(subjects));
    } catch (e) {
      emit(GetAllSubjectErrorState(e.toString()));
    }
  }
}
