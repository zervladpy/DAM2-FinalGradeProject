import 'package:gallopgate/core/domain/entities/entity.dart';

class Address extends IEntity {
  const Address({
    required this.country,
    required this.city,
    required this.street,
    required this.postalCode,
  });

  final String country;
  final String city;
  final String street;
  final String postalCode;
}
