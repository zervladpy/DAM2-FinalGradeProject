import 'package:gallopgate/core/domain/entities/entity.dart';

class Lecture extends IEntity {
  const Lecture({
    required this.uid,
    required this.description,
    required this.longDescription,
  });

  final String uid, description, longDescription;
}
