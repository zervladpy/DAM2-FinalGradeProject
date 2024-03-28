import 'package:gallopgate/core/data/models/model.dart';

/// Data source interface
///
/// This interface is used to define the methods that a data source should implement.
///
/// The data source is responsible for the CRUD operations of the data.
///
/// [T] is the model that the data source will handle.
/// [DataSourceParams] is the parameters that the data source will receive.
abstract class DataSoruce<T extends IModel> {
  Future<T?> create(DataSourceParams<T> params);
  Future<T?> read(DataSourceParams<T> params);
  Future<T?> update(DataSourceParams<T> params);
  Future<void> delete(DataSourceParams<T> params);
}

/// Remote data source
abstract class RemoteDataSource<T extends IModel> extends DataSoruce<T> {}

/// Local data source
abstract class LocalDataSource<T extends IModel> extends DataSoruce<T> {}

class DataSourceParams<T extends IModel> {
  DataSourceParams({
    required this.uid,
    this.model,
  });

  final String uid;
  final T? model;
}
