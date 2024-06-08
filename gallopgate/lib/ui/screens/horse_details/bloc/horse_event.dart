part of 'horse_bloc.dart';

abstract class HorseEvent extends Equatable {
  const HorseEvent();

  @override
  List<Object?> get props => [];
}

class Fetch extends HorseEvent {
  final String organizationId;
  final String id;

  const Fetch({required this.id, required this.organizationId});

  @override
  List<Object> get props => [id, organizationId];
}

class Update extends HorseEvent {
  const Update();

  @override
  List<Object> get props => [];
}

class NameChanged extends HorseEvent {
  final String name;

  const NameChanged({required this.name});

  @override
  List<Object> get props => [name];
}

class AliasChanged extends HorseEvent {
  final String alias;

  const AliasChanged({required this.alias});

  @override
  List<Object> get props => [alias];
}

class OwnerChanged extends HorseEvent {
  final String? ownerId;

  const OwnerChanged({required this.ownerId});

  @override
  List<Object?> get props => [ownerId];
}
