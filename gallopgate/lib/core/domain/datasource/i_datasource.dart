import 'package:gallopgate/core/domain/models/i_model.dart';

abstract class IDatasource<T extends IModel, ID> {
  const IDatasource();

  /// Finds [T] from its [ID]
  Future<T?> find(ID id);

  /// Finds all [T]
  Future<List<T>> findAll();

  /// Deletes [T] by [ID]
  Future<bool> delete(ID id);

  /// Updates [T] by [ID]
  Future<bool> update(ID id, T model);

  /// Creates [T] with [ID]
  Future<bool> create(ID id, T model);
}