import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/get_all_subject_usecase.dart';
import 'get_all_subject_states.dart';

@injectable
class GetAllSubjectViewModel extends Cubit<GetAllSubjectStates> {
  final GetAllSubjectUseCases _allSubjectUseCases;

  GetAllSubjectViewModel(this._allSubjectUseCases)
    : super(GetAllSubjectInitialState());

  Future<void> getAllSubject() async {
    emit(GetAllSubjectLoadingState());

    try {
      final subjects = await _allSubjectUseCases();
      emit(GetAllSubjectSuccessState(subjects));
    } catch (e) {
      print(e.toString());
      emit(GetAllSubjectErrorState(e.toString()));
    }
  }
}
