// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamResponse _$ExamResponseFromJson(Map<String, dynamic> json) => ExamResponse(
  message: json['message'] as String,
  metadata: MetadataModel.fromJson(json['metadata'] as Map<String, dynamic>),
  exams:
      (json['exams'] as List<dynamic>)
          .map((e) => ExamModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ExamResponseToJson(ExamResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'exams': instance.exams,
    };
