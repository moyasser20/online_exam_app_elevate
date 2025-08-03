// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamDetailsResponse _$ExamDetailsResponseFromJson(Map<String, dynamic> json) =>
    ExamDetailsResponse(
      message: json['message'] as String,
      exam: ExamModel.fromJson(json['exam'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExamDetailsResponseToJson(
  ExamDetailsResponse instance,
) => <String, dynamic>{'message': instance.message, 'exam': instance.exam};
