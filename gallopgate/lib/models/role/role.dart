import 'package:json_annotation/json_annotation.dart';

part 'role.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class Role {
  const Role(this.id, this.name);

  final int id;
  final String name;

  static const Role empty = Role(0, '');

  static const table = 'roles';

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  @override
  String toString() {
    return 'Role{id: $id, name: $name}';
  }
}
