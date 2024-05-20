import 'package:gallopgate/v1/common/data/datasources/remote/remote_datasource.dart';
import 'package:gallopgate/v1/common/data/entities/lecture/lecture_entity.dart';

abstract class LectureRemoteDatasource<T> extends RemoteDatasource<T> {
  const LectureRemoteDatasource(super.source);

  Future<LectureEntity?> fetch(String id);
  Future<List<LectureEntity>> fetchMany(List<String> ids);
  Future<LectureEntity?> create(LectureEntity entity);
  Future<LectureEntity?> update(LectureEntity entity);
  Future<void> delete(String id);
}
