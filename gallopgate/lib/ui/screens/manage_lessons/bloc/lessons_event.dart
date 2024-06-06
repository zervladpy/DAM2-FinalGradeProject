part of 'lessons_bloc.dart';

class LessonsEvent extends Equatable {
  const LessonsEvent();

  @override
  List<Object> get props => [];
}

class Fetch extends LessonsEvent {}

class Filter extends LessonsEvent {
  final String query;

  const Filter(this.query);

  @override
  List<Object> get props => [query];
}
