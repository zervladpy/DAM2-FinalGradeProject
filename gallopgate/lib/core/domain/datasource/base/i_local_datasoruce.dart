import 'package:gallopgate/core/domain/datasource/base/i_datasource.dart';
import 'package:gallopgate/core/domain/models/i_model.dart';

abstract class ILocalDatasource<T extends IModel, ID> extends IDatasource<T, ID> {
  const ILocalDatasource();
}