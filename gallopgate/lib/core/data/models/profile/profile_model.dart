import 'package:gallopgate/core/data/models/license/license_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.kebab)
class ProfileModel {
  const ProfileModel({
    required this.uid,
    required this.name,
    required this.surname,
    required this.email,
    this.riderLicense,
    this.instructorLicense,
    this.profilesUid,
  });

  final String uid;
  final String name;
  final String surname;
  final String email;
  final LicenseModel? riderLicense;
  final LicenseModel? instructorLicense;
  final List<String>? profilesUid;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
