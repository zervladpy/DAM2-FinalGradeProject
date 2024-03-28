import 'package:gallopgate/core/data/models/model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../utils/enums/week_day.dart';

part 'schedule_cell_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class ScheduleCellModel extends IModel {
  const ScheduleCellModel({
    required this.uid,
    required this.hStart,
    required this.hDuration,
    required this.weekDay,
    required this.capacity,
    required this.lectureUid,
    required this.instructorUid,
    required this.ridersUid,
  });

  final String uid;
  final double hStart;
  final double hDuration;
  final WeekDay weekDay;
  final int capacity;
  final String lectureUid;
  final String instructorUid;
  final List<String> ridersUid;

  factory ScheduleCellModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleCellModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleCellModelToJson(this);
}
