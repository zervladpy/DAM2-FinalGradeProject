import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/interfaces/crud_repository.dart';

abstract class RelatimeRepository<Model extends Equatable, Id>
    extends CrudRepository<Model, Id> {
  Stream<Model> getModelStream();
  Stream<List<Model>> getListModelStream();
}
