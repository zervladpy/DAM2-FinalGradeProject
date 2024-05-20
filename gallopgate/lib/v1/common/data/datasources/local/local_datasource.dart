import 'package:gallopgate/v1/common/data/datasources/datasource.dart';

abstract class LocalDatasource<T> extends Datasource<T> {
  const LocalDatasource(super.source);
}
