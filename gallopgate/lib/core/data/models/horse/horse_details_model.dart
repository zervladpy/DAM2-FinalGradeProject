import 'package:gallopgate/core/data/models/model.dart';
import 'package:gallopgate/utils/enums/horse_gender.dart';
import 'package:json_annotation/json_annotation.dart';

part 'horse_details_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class HorseDetailsModel extends IModel {
  const HorseDetailsModel({
    required this.gender,
    required this.height,
    required this.weight,
    required this.birthDate,
  });

  final HorseGender gender;
  final double height;
  final double weight;
  final DateTime birthDate;

  factory HorseDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$HorseDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$HorseDetailsModelToJson(this);
}
