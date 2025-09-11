class ExamHistoryEntity {
  final String examId;
  final int answeredQuestionsCount;
  final int correctAnswersCount;
  final int timeTakenMinutes;
  final DateTime submittedAt;

  // Snapshot of exam when taken (to render list without refetching)
  final String examTitle;
  final int examDurationMinutes;
  final int examTotalQuestions;
  final List<String?> selectedAnswers;

  const ExamHistoryEntity({
    required this.examId,
    required this.answeredQuestionsCount,
    required this.correctAnswersCount,
    required this.timeTakenMinutes,
    required this.submittedAt,
    required this.examTitle,
    required this.examDurationMinutes,
    required this.examTotalQuestions,
    required this.selectedAnswers,
  });
}


