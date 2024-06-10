part of 'manage_lessons_bloc.dart';

sealed class ManageLessonsEvent extends Equatable {
  const ManageLessonsEvent();

  @override
  List<Object> get props => [];
}

class Fetch extends ManageLessonsEvent {
  final String organizationId;

  const Fetch({required this.organizationId});

  @override
  List<Object> get props => [organizationId];
}
