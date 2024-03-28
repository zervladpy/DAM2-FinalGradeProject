import 'package:gallopgate/utils/enums/license_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'license_model.g.dart';

@JsonSerializable()
class LicenseModel {
  const LicenseModel({
    required this.uid,
    required this.serial,
    required this.expDate,
    required this.cadDate,
    required this.type,
  });

  final String uid;
  final String serial;
  final DateTime expDate;
  final DateTime cadDate;
  final LicenseType type;

  factory LicenseModel.fromJson(Map<String, dynamic> json) =>
      _$LicenseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LicenseModelToJson(this);
}
