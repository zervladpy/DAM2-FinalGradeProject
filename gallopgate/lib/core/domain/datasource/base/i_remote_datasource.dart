import 'package:gallopgate/core/domain/datasource/base/i_datasource.dart';
import 'package:gallopgate/core/domain/models/i_model.dart';

abstract class IRemoteDatasource<T extends IModel, ID> extends IDatasource<T, ID> {
  const IRemoteDatasource();
}