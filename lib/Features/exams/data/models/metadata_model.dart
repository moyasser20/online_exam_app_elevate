import 'package:json_annotation/json_annotation.dart';

part 'metadata_model.g.dart';

@JsonSerializable()
class MetadataModel {
  @JsonKey(name: "currentPage")
  final int currentPage;
  @JsonKey(name: "numberOfPages")
  final int numberOfPages;
  @JsonKey(name: "limit")
  final int limit;

  MetadataModel({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
  });

  factory MetadataModel.fromJson(Map<String, dynamic> json) {
    return _$MetadataModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetadataModelToJson(this);
  }
}
