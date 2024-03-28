import 'package:gallopgate/core/data/models/address/address_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'institution_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.kebab)
class InstitutionModel {
  const InstitutionModel({
    required this.uid,
    required this.name,
    required this.creator,
    required this.address,
  });

  final String uid;
  final String name;
  final String creator;
  final AddressModel address;

  factory InstitutionModel.fromJson(Map<String, dynamic> json) =>
      _$InstitutionModelFromJson(json);

  Map<String, dynamic> toJson() => _$InstitutionModelToJson(this);
}
