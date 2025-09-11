import '../../domain/entities/exam_history_entity.dart';

abstract class ResultState {}

class ResultInitial extends ResultState {}

class ResultLoading extends ResultState {}

class ResultLoaded extends ResultState {
  final List<ExamHistoryEntity> history;
  ResultLoaded(this.history);
}

class ResultError extends ResultState {
  final String message;
  ResultError(this.message);
}
