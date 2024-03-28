import 'package:json_annotation/json_annotation.dart';

part 'horse_work_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class HorseWorkModel {
  const HorseWorkModel({
    required this.date,
    required this.hTime,
  });

  final DateTime date;
  final double hTime;

  factory HorseWorkModel.fromJson(Map<String, dynamic> json) =>
      _$HorseWorkModelFromJson(json);

  Map<String, dynamic> toJson() => _$HorseWorkModelToJson(this);
}
