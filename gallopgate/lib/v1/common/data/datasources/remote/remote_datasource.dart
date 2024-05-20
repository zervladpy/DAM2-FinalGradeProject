import 'package:gallopgate/v1/common/data/datasources/datasource.dart';

abstract class RemoteDatasource<T> extends Datasource<T> {
  const RemoteDatasource(super.source);
}
