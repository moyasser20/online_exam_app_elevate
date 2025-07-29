// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subjects_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectsResponseModel _$SubjectsResponseModelFromJson(
  Map<String, dynamic> json,
) => SubjectsResponseModel(
  message: json['message'] as String,
  subjects:
      (json['subjects'] as List<dynamic>)
          .map((e) => SubjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$SubjectsResponseModelToJson(
  SubjectsResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'subjects': instance.subjects,
};
