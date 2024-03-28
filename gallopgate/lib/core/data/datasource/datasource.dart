import 'package:gallopgate/core/data/models/model.dart';

/// Data source interface
///
/// This interface is used to define the methods that a data source should implement.
///
/// The data source is responsible for the CRUD operations of the data.
///
/// [T] is the model that the data source will handle.
abstract class DataSoruce<T extends IModel> {
  const DataSoruce();
  Future<void> create(T model, String uid);
  Future<T?> read(String uid);
  Future<T?> update(T model, String uid);
  Future<void> delete(String uid);
}

/// Remote data source
abstract class RemoteDataSource<T extends IModel> extends DataSoruce<T> {
  const RemoteDataSource();
}

/// Local data source
abstract class LocalDataSource<T extends IModel> extends DataSoruce<T> {}
