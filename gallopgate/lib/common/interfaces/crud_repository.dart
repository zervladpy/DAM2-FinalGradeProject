abstract class CrudRepository<Model, Id> {
  Future<Model> create(Model model);
  Future<Model?> read(Id id);
  Future<Model?> update(Model model);
  Future<void> delete(Id id);
}
