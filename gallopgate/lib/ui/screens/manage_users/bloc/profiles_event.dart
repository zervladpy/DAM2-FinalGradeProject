part of 'profiles_bloc.dart';

class ProfilesEvent extends Equatable {
  const ProfilesEvent();

  @override
  List<Object> get props => [];
}

class Fetch extends ProfilesEvent {}

class Filter extends ProfilesEvent {
  final String query;

  const Filter(this.query);

  @override
  List<Object> get props => [query];
}
