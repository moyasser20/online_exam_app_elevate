// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamModel _$ExamModelFromJson(Map<String, dynamic> json) => ExamModel(
  Id: json['_id'] as String,
  title: json['title'] as String,
  duration: (json['duration'] as num).toInt(),
  subject: json['subject'] as String,
  numberOfQuestions: (json['numberOfQuestions'] as num).toInt(),
  active: json['active'] as bool,
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$ExamModelToJson(ExamModel instance) => <String, dynamic>{
  '_id': instance.Id,
  'title': instance.title,
  'duration': instance.duration,
  'subject': instance.subject,
  'numberOfQuestions': instance.numberOfQuestions,
  'active': instance.active,
  'createdAt': instance.createdAt,
};
