import 'package:json_annotation/json_annotation.dart';
import '../exam_model.dart';
import '../metadata_model.dart';

part 'exam_response.g.dart';

@JsonSerializable()
class ExamResponse {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "metadata")
  final MetadataModel metadata;
  @JsonKey(name: "exams")
  final List<ExamModel> exams;

  ExamResponse ({
    required this.message,
    required this.metadata,
    required this.exams,
  });

  factory ExamResponse.fromJson(Map<String, dynamic> json) {
    return _$ExamResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExamResponseToJson(this);
  }
}


