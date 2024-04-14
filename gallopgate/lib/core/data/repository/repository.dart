import 'package:gallopgate/core/domain/datasource/base/i_remote_datasource.dart';
import 'package:gallopgate/core/domain/models/i_model.dart';
import 'package:gallopgate/core/domain/repository/base/i_repository.dart';
import 'package:gallopgate/utils/response/response.dart';

abstract class Repository<T extends IModel, ID> extends IRepository<T, ID> {

  const Repository({required this.remote});
  final IRemoteDatasource remote;

  @override
  Future<Response<bool>> create(ID id, T model) async {
    bool created = await remote.create(id, model);
    return created ? Response.success(created) : Response.failure("create-error");
  }

  @override
  Future<Response<bool>> delete(ID id) async {
    bool deleted = await remote.delete(id);
    return deleted ? Response.success(deleted) : Response.failure("delete-error");
  }

  @override
  Future<Response<T?>> find(ID id) async {
    T? data = await remote.find(id) as T;
    return Response.success(data);
  }

  @override
  Future<Response<List<T>>> findAll() async {
    List<T> data = await remote.findAll() as List<T>;
    return Response.success(data);
  }

  @override
  Future<Response<bool>> update(ID id, T model) async {
    bool updated = await remote.update(id, model);
    return updated ? Response.success(updated) : Response.failure("update-error");
  }

}