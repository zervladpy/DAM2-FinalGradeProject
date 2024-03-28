import 'package:gallopgate/core/data/models/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class AddressModel extends IModel {
  const AddressModel({
    required this.country,
    required this.city,
    required this.street,
    required this.postalCode,
  });

  final String country;
  final String city;
  final String street;
  final String postalCode;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
