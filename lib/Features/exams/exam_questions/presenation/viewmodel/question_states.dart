import 'package:equatable/equatable.dart';
import '../../../domain/entity/question_entity.dart';

sealed class QuestionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class QuestionInitial extends QuestionState {}

class QuestionLoading extends QuestionState {}

class QuestionLoaded extends QuestionState {
  final List<QuestionEntity> questions;
  final List<String?> selectedAnswers;
  final int currentPage;

  QuestionLoaded({
    required this.questions,
    required this.selectedAnswers,
    required this.currentPage,
  });

  QuestionLoaded copyWith({
    List<QuestionEntity>? questions,
    List<String?>? selectedAnswers,
    int? currentPage,
  }) {
    return QuestionLoaded(
      questions: questions ?? this.questions,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object?> get props => [questions, selectedAnswers, currentPage];
}

class QuestionError extends QuestionState {
  final String message;

  QuestionError(this.message);

  @override
  List<Object?> get props => [message];
}
