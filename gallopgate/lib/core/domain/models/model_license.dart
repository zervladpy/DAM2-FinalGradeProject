
import 'package:gallopgate/core/domain/models/i_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_license.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.kebab)
class License extends IModel {
  const License({
    required this.uid,
    required this.serial,
    required this.issued,
    required this.expires,
  });

  final String uid, serial;
  final DateTime issued, expires;


  factory License.fromJson(Map<String, dynamic> json) =>
      _$LicenseFromJson(json);

  Map<String, dynamic> toJson() => _$LicenseToJson(this);

}
