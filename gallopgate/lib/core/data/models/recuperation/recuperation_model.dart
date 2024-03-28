import 'package:gallopgate/core/data/models/model.dart';
import 'package:gallopgate/utils/enums/recuperation_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recuperation_model.g.dart';

@JsonSerializable()
class RecuperationModel extends IModel {
  const RecuperationModel({
    required this.uid,
    required this.date,
    required this.profileUid,
    required this.status,
  });

  final String uid;
  final DateTime date;
  final String profileUid;
  final RecuperationStatus status;

  factory RecuperationModel.fromJson(Map<String, dynamic> json) =>
      _$RecuperationModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecuperationModelToJson(this);
}
