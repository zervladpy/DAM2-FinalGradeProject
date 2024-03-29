
import 'package:gallopgate/core/domain/models/i_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_institution.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.kebab)
class Institution extends IModel {
  const Institution({
    required this.uid,
    required this.name,
    required this.creator,
  });

  final String uid, name, creator;

  factory Institution.fromJson(Map<String, dynamic> json) =>
      _$InstitutionFromJson(json);

  Map<String, dynamic> toJson() => _$InstitutionToJson(this);

}
