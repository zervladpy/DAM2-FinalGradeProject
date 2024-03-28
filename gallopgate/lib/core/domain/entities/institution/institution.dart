import 'package:gallopgate/core/domain/entities/address/address.dart';
import 'package:gallopgate/core/domain/entities/entity.dart';

class Institution extends IEntity {
  Institution({
    required this.uid,
    required this.name,
    required this.creator,
    required this.address,
  });

  final String uid, name, creator;
  final Address address;
}
