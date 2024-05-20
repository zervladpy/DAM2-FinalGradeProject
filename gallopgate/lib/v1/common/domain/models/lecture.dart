import 'package:equatable/equatable.dart';

class Lecture extends Equatable {
  const Lecture({
    required this.id,
    required this.name,
    required this.description,
    required this.organizationId,
  });

  final String id, name, description, organizationId;

  static const empty = Lecture(
    id: "",
    name: "",
    description: "",
    organizationId: "",
  );

  bool get isEmpty => this == Lecture.empty;
  bool get isNotEmpty => this != Lecture.empty;

  @override
  List<Object?> get props => [id, name, description];
}
