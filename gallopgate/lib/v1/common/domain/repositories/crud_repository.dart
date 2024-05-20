/// Base class for CRUD operations on a repository.
/// [Model] is the type of the model to be manipulated.
/// [Id] is the type of the model's identifier.
///
/// Includes:
/// - fetchMany: Fetches many models by their identifiers.
/// - fetch: Fetches a model by its identifier.
/// - create: Creates a model.
/// - update: Updates a model.
/// - delete: Deletes a model by its identifier.
abstract class CrudRepository<Model, Id> {
  Future<List<Model>> fetchMany(List<Id> ids);
  Future<Model?> fetch(Id id);
  Future<Model?> create(Model model);
  Future<Model?> update(Model model);
  Future<void> delete(Id id);
}
