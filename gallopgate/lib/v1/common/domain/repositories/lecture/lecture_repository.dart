import 'package:gallopgate/v1/common/domain/models/lecture.dart';
import 'package:gallopgate/v1/common/domain/repositories/crud_repository.dart';

abstract class LectureRepository extends CrudRepository<Lecture, String> {}
