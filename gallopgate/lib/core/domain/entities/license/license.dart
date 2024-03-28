import 'package:gallopgate/core/domain/entities/entity.dart';
import 'package:gallopgate/utils/enums/license_type.dart';

class License extends IEntity {
  License({
    required this.uid,
    required this.serial,
    required this.expDate,
    required this.cadDate,
    required this.type,
  });

  final String uid, serial;
  final DateTime expDate, cadDate;
  final LicenseType type;
}
