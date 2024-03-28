import 'package:gallopgate/core/data/models/model.dart';
import 'package:gallopgate/core/domain/entities/entity.dart';

/// Mapper Interface
///
/// Maps Entity to Model and Model to Entity
abstract class Mapper<M extends IModel, E extends IEntity> {
  /// Maps the entity to the model
  E mapFromModel(M model);

  /// Maps the model to the entity
  M mapToModel(E entity);
}
