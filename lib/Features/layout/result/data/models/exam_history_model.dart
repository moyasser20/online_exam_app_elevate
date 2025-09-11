import '../../domain/entities/exam_history_entity.dart';

class ExamHistoryModel extends ExamHistoryEntity {
  const ExamHistoryModel({
    required super.examId,
    required super.answeredQuestionsCount,
    required super.correctAnswersCount,
    required super.timeTakenMinutes,
    required super.submittedAt,
    required super.examTitle,
    required super.examDurationMinutes,
    required super.examTotalQuestions,
    required super.selectedAnswers,
  });

  factory ExamHistoryModel.fromJson(Map<String, dynamic> json) {
    return ExamHistoryModel(
      examId: json['examId'] as String,
      answeredQuestionsCount: json['answeredQuestionsCount'] as int,
      correctAnswersCount: json['correctAnswersCount'] as int,
      timeTakenMinutes: json['timeTakenMinutes'] as int,
      submittedAt: DateTime.parse(json['submittedAt'] as String),
      examTitle: json['examTitle'] as String,
      examDurationMinutes: json['examDurationMinutes'] as int,
      examTotalQuestions: json['examTotalQuestions'] as int,
      selectedAnswers: (json['selectedAnswers'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const <String?>[],
    );
  }

  Map<String, dynamic> toJson() => {
        'examId': examId,
        'answeredQuestionsCount': answeredQuestionsCount,
        'correctAnswersCount': correctAnswersCount,
        'timeTakenMinutes': timeTakenMinutes,
        'submittedAt': submittedAt.toIso8601String(),
        'examTitle': examTitle,
        'examDurationMinutes': examDurationMinutes,
        'examTotalQuestions': examTotalQuestions,
        'selectedAnswers': selectedAnswers,
      };
}


