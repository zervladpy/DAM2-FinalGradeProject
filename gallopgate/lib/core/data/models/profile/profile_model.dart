import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  const ProfileModel({
    required this.uid,
    required this.name,
    required this.surname,
    required this.email,
    this.riderLicenseUid,
    this.instructorLicenseUid,
    this.profilesUid,
  });

  final String uid;
  final String name;
  final String surname;
  final String email;
  final String? riderLicenseUid;
  final String? instructorLicenseUid;
  final List<String>? profilesUid;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
