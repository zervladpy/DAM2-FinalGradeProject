import 'package:gallopgate/core/data/models/horse/horse_details_model.dart';
import 'package:gallopgate/core/data/models/horse/horse_work_model.dart';
import 'package:gallopgate/core/data/models/license/license_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'horse_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.kebab)
class HorseModel {
  const HorseModel({
    required this.uid,
    required this.fullName,
    required this.license,
    this.acronym,
    this.details,
    this.work,
  });

  final String uid;
  final String fullName;
  final String? acronym;
  final LicenseModel license;
  final HorseDetailsModel? details;
  final List<HorseWorkModel>? work;

  factory HorseModel.fromJson(Map<String, dynamic> json) =>
      _$HorseModelFromJson(json);

  Map<String, dynamic> toJson() => _$HorseModelToJson(this);
}
