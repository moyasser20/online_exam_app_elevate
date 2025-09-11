// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    QuestionModel(
      Id: json['_id'] as String,
      question: json['question'] as String,
      answers:
          (json['answers'] as List<dynamic>)
              .map((e) => AnswersModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      type: json['type'] as String,
      correct: json['correct'] as String,
      exam: ExamModel.fromJson(json['exam'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) =>
    <String, dynamic>{
      '_id': instance.Id,
      'question': instance.question,
      'answers': instance.answers,
      'type': instance.type,
      'correct': instance.correct,
      'exam': instance.exam,
      'createdAt': instance.createdAt,
    };
