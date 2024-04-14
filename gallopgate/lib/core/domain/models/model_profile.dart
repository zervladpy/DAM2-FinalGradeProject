import 'package:gallopgate/core/domain/models/i_model.dart';
import 'package:gallopgate/core/domain/models/model_license.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_profile.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.kebab)
class Profile extends IModel {
  const Profile({
    required this.uid,
    required this.name,
    required this.surname,
    required this.email,
    required this.licenses,
  });

  final String uid, name, surname, email;
  final List<License> licenses;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);

}
