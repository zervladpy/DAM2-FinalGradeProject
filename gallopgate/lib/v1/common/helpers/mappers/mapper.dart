/// Helper for `domain model` < - > `data enity` mapping
abstract class Mapper<M, E> {
  /// Maps [E] `data entity` to [M] `domain model`
  M toModel(E entity);

  /// Maps [M] `domain model` to [E] `data entity`
  E toEntity(M model);
}
