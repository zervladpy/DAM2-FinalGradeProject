import 'package:gallopgate/core/data/datasource/datasource.dart';
import 'package:gallopgate/core/data/models/model.dart';
import 'package:gallopgate/core/domain/entities/entity.dart';
import 'package:gallopgate/utils/response/response.dart';

/// Repository
///
/// Abstract class that defines the methods that a repository should implement.
///
/// [T] is the entity that the repository will handle.
/// [M] is the model that the datasource will handle.
abstract class Repository<T extends IEntity, M extends IModel> {
  const Repository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final RemoteDataSource<M> remoteDataSource;
  final LocalDataSource<M> localDataSource;

  Future<Response<T?>> create(T entity);

  Future<Response<T?>> read(String uid);

  Future<Response<T?>> update(T entity);

  Future<Response<void>> delete(String uid);
}
