import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_exam_history_usecase.dart';
import '../../domain/usecases/clear_exam_history_usecase.dart';
import '../../domain/entities/exam_history_entity.dart';
import 'result_states.dart';

@injectable
class ResultViewModel extends Cubit<ResultState> {
  final GetExamHistoryUseCase getHistory;
  final ClearExamHistoryUseCase clearHistory;

  ResultViewModel(this.getHistory, this.clearHistory) : super(ResultInitial());

  Future<void> loadHistory() async {
    emit(ResultLoading());
    try {
      final List<ExamHistoryEntity> list = await getHistory();
      emit(ResultLoaded(list));
    } catch (e) {
      emit(ResultError(e.toString()));
    }
  }

  Future<void> clearAll() async {
    emit(ResultLoading());
    try {
      await clearHistory();
      emit(ResultLoaded(const []));
    } catch (e) {
      emit(ResultError(e.toString()));
    }
  }
}


