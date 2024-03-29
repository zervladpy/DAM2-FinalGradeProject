
import 'package:json_annotation/json_annotation.dart';

import 'i_model.dart';


part 'model_address.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.kebab)
class Address extends IModel {
  const Address({
    required this.street,
    required this.city,
    required this.state,
    required this.zip,
  });

  final String street, city, state, zip;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

}
