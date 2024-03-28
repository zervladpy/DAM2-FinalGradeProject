import 'package:json_annotation/json_annotation.dart';

part 'recuperation_model.g.dart';

@JsonSerializable()
class RecuperationModel {
  const RecuperationModel({
    required this.uid,
    required this.date,
    required this.profileUid,
  });

  final String uid;
  final DateTime date;
  final String profileUid;

  factory RecuperationModel.fromJson(Map<String, dynamic> json) =>
      _$RecuperationModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecuperationModelToJson(this);
}
