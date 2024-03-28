import 'package:gallopgate/core/data/models/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'assistance_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class AssistanceModel extends IModel {
  const AssistanceModel({
    required this.uid,
    required this.date,
    required this.justified,
    required this.scheduleUid,
    required this.profileUid,
  });

  final String uid;
  final DateTime date;
  final bool justified;
  final String scheduleUid;
  final String profileUid;

  factory AssistanceModel.fromJson(Map<String, dynamic> json) =>
      _$AssistanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$AssistanceModelToJson(this);
}
