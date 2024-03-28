import 'package:json_annotation/json_annotation.dart';

part 'lecture_model.g.dart';

@JsonSerializable()
class LectureModel {
  const LectureModel({
    required this.uid,
    required this.description,
    required this.longDescription,
  });

  final String uid;
  final String description;
  final String longDescription;

  factory LectureModel.fromJson(Map<String, dynamic> json) =>
      _$LectureModelFromJson(json);

  Map<String, dynamic> toJson() => _$LectureModelToJson(this);
}
