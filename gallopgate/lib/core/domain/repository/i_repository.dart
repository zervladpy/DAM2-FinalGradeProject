
import 'package:gallopgate/utils/response/response.dart';

import '../models/i_model.dart';

/// Domain Repository Contract
abstract class IRepository<T extends IModel, ID> {

  const IRepository();

  /// Finds a [T] by its [ID]
  Future<Response<T?>> find(ID id);

  /// Finds all [T]
  Future<Response<List<T>>> findAll();

  /// Updates a [T]
  Future<Response<bool>> update(ID id, T model);

  /// Deletes a [T] by its [ID]
  Future<Response<bool>> delete(ID id);

  /// Creates a [T]
  Future<Response<bool>> create(ID id, T model);
}

